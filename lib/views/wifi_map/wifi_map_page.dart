import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/providers/shared_preferences_provider.dart';
import 'package:my_app_module/utils/build_context_extension.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_spacing_extension.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/utils/design/room_types.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/viewmodels/wifi_map/wifi_map_viewmodel_provider.dart';
import 'package:my_app_module/views/wifi_map/edit_room_bottom_sheet.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/widgets/badge.dart';
import 'package:my_app_module/widgets/edit_button.dart';
import 'package:my_app_module/widgets/edit_floor_name_dialog.dart';
import 'package:my_app_module/widgets/wifi_map_dialog.dart';

/// Wi-Fi 地图页面
/// 显示楼层的 Wi-Fi 设备网格，支持缩放和滑动
class WifiMapPage extends HookConsumerWidget {
  final String? floorId;

  const WifiMapPage({super.key, this.floorId});

  static const int crossAxisCount = 10;
  static final double spacing = 4.w;
  static const String _dialogShownKey = 'has_shown_wifi_map_dialog';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floorState = ref.watch(floorViewModelProvider);

    useEffect(() {
      _checkAndShowDialog(context, ref);
      Future.microtask(() {
        ref.read(wifiMapViewModelProvider.notifier).loadHosts();
        if (floorId != null && floorId!.isNotEmpty) {
          ref.read(floorViewModelProvider.notifier).loadFloorById(floorId!);
        } else {
          ref.read(floorViewModelProvider.notifier).loadActiveFloor();
        }
      });
      return null;
    }, [floorId]);

    final transformationController = useMemoized(() {
      final controller = TransformationController();
      controller.value = Matrix4.identity()..scaleByDouble(1.5, 1.5, 1.0, 1.0);
      return controller;
    });

    final statusBarHeight = MediaQuery.of(context).padding.top;

    final selectedIdx = useState<int?>(null);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _buildBackButton(context),
          _buildFloorTitle(context, floorState, ref),
          SizedBox(height: 16.h),
          _buildAutoSizeGrid(
            context,
            transformationController,
            floorState,
            selectedIdx,
          ),
          _buildBottomBar(context, floorState, selectedIdx),
        ],
      ),
    );
  }

  Widget _buildAutoSizeGrid(
    BuildContext context,
    TransformationController transformationController,
    FloorState floorState,
    ValueNotifier<int?> selectedIdx,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final double minHorizontalPadding = 16.w;
        final double availableWidth = screenWidth - minHorizontalPadding * 2;
        final double totalSpacingWidth = (crossAxisCount - 1) * spacing;
        final double squareSize =
            (availableWidth - totalSpacingWidth) / crossAxisCount;
        const int totalItemCount = 110;
        final int rowCount = (totalItemCount / crossAxisCount).ceil();
        final double totalGridHeight =
            rowCount * squareSize + (rowCount - 1) * spacing;
        return SizedBox(
          width: double.infinity,
          height: totalGridHeight.h,
          child: InteractiveViewer(
            alignment: Alignment.topLeft,
            minScale: 1.0,
            maxScale: 2.0,
            boundaryMargin: EdgeInsets.zero,
            transformationController: transformationController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: minHorizontalPadding),
              child: _buildGrid(context, squareSize, floorState, selectedIdx),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(
    BuildContext context,
    double squareSize,
    FloorState floorState,
    ValueNotifier<int?> selectedIdx,
  ) {
    final rooms = floorState.maybeWhen(
      loaded: (floor) => floor?.rooms ?? [],
      orElse: () => <RoomModel>[],
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1,
      ),
      itemCount: 110,
      itemBuilder: (context, index) {
        final room = rooms.where((r) => r.index == index).firstOrNull;
        final isSelected = selectedIdx.value == index;
        return GestureDetector(
          onTap: () {
            if (room == null) {
              EditRoomBottomSheet.show(context, index);
            } else {
              selectedIdx.value = index;
            }
          },
          child: room != null
              ? _buildRoomCell(context, room, isSelected)
              : _buildEmptyCell(context),
        );
      },
    );
  }

  Widget _buildRoomCell(BuildContext context, RoomModel room, bool isSelected) {
    final roomType = RoomType.values.firstWhere(
      (e) => e.name == room.roomType,
      orElse: () => RoomType.backyard,
    );

    return Container(
      decoration: BoxDecoration(
        color: context.appColors.gray4,
        borderRadius: BorderRadius.circular(6.r),
        border: isSelected
            ? Border.all(
                color: context.appColors.fontGy1with90Opacity,
                width: 1.2.w,
              )
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0.3),
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: 80.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppImage(roomType.imagePath, width: 24.w, height: 24.w),
                    SizedBox(height: 4.w),
                    Text(
                      room.roomName,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: context.appColors.fontGy1with90Opacity,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (room.isGateway != null)
            Align(
              alignment: Alignment.topRight,
              child: FractionallySizedBox(
                heightFactor: 0.25,
                child: AppBadge(
                  label: room.isGateway == true
                      ? context.l10n.router
                      : context.l10n.extender,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyCell(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.gray1,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }

  Widget _buildFloorTitle(
    BuildContext context,
    FloorState floorState,
    WidgetRef ref,
  ) {
    final floorName = floorState.maybeWhen(
      loaded: (floor) => floor?.floorName ?? context.l10n.firstFloor,
      orElse: () => context.l10n.firstFloor,
    );

    return GestureDetector(
      onTap: () async {
        final currentFloorName = floorState.maybeWhen(
          loaded: (floor) => floor?.floorName,
          orElse: () => null,
        );
        final newFloorName = await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              EditFloorNameDialog(initialFloorName: currentFloorName),
        );
        if (newFloorName != null && newFloorName.isNotEmpty) {
          await ref
              .read(floorViewModelProvider.notifier)
              .updateFloorName(newFloorName);
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Row(
          children: [
            Text(
              floorName,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: context.appColors.fontGy1with90Opacity,
              ),
            ),
            Spacing.h2,
            _buildEditButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              'chevron_left.png',
              width: AppSpacing.icon24.w,
              height: AppSpacing.icon24.w,
              color: context.appColors.fontGy1with90Opacity,
            ),
            Spacing.h8,
            Text(
              context.l10n.back,
              style: context.appTextStyles.bodyLargeWith90Opacity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return EditButton(onTap: () {});
  }

  Widget _buildBottomBar(
    BuildContext context,
    FloorState floorState,
    ValueNotifier<int?> selectedIdx,
  ) {
    final isSelected = selectedIdx.value != null;
    if (isSelected) {
      final RoomModel? room = floorState.maybeWhen(
        loaded: (floor) {
          final rooms = floor?.rooms ?? [];
          final matched = rooms.where((r) => r.index == selectedIdx.value);
          return matched.isNotEmpty ? matched.first : null;
        },
        orElse: () => null,
      );
      if (room == null) {
        return _buildStats(context, floorState);
      }
      return _buildSelectedRoomBar(context, room);
    } else {
      return _buildStats(context, floorState);
    }
  }

  Widget _buildSelectedRoomBar(BuildContext context, RoomModel room) {
    final RoomType roomType = RoomType.values.firstWhere(
      (e) => e.name == room.roomType,
      orElse: () => RoomType.backyard,
    );

    return Padding(
      padding: EdgeInsets.all(AppSpacing.pad16.w),
      child: Row(
        children: [
          AppImage(roomType.imagePath, width: 20.w, height: 20.w),
          SizedBox(width: 4.w),
          Text(
            room.roomName,
            style: context.appTextStyles.titleWith90Opacity.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 4.w),
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context, FloorState floorState) {
    final int roomCount = floorState.maybeWhen(
      loaded: (floor) => floor?.rooms.length ?? 0,
      orElse: () => 0,
    );

    return Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.pad16.w,
        left: AppSpacing.pad16.w,
      ),
      child: Text(
        context.l10n.zonesCount(roomCount),
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }

  Future<void> _checkAndShowDialog(BuildContext context, WidgetRef ref) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final bool hasShown = prefs.getBool(_dialogShownKey) ?? false;
    if (!hasShown) {
      await prefs.setBool(_dialogShownKey, true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const WifiMapDialog(),
        );
      });
    }
  }
}
