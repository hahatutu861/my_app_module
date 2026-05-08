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
import 'package:my_app_module/widgets/wifi_map_dialog.dart';

/// Wi-Fi 地图页面
/// 显示楼层的 Wi-Fi 设备网格，支持缩放和滑动
class WifiMapPage extends HookConsumerWidget {
  final String? floorId;

  const WifiMapPage({super.key, this.floorId});

  static const int crossAxisCount = 10;
  static const double spacing = 4;
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _buildBackButton(context),
          _buildFloorTitle(context, floorState),
          SizedBox(height: 16),
          _buildAutoSizeGrid(context, transformationController, floorState),
          _buildStats(context, floorState),
        ],
      ),
    );
  }

  Widget _buildAutoSizeGrid(
    BuildContext context,
    TransformationController transformationController,
    FloorState floorState,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        const double minHorizontalPadding = 16;
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
          height: totalGridHeight,
          child: InteractiveViewer(
            alignment: Alignment.topLeft,
            minScale: 1.0,
            maxScale: 2.0,
            boundaryMargin: EdgeInsets.zero,
            transformationController: transformationController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: minHorizontalPadding),
              child: _buildGrid(context, squareSize, floorState),
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
  ) {
    final rooms = floorState.maybeWhen(
      loaded: (floor) => floor?.rooms ?? [],
      orElse: () => <RoomModel>[],
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1,
      ),
      itemCount: 110,
      itemBuilder: (context, index) {
        final room = rooms.where((r) => r.index == index).firstOrNull;
        return GestureDetector(
          onTap: () => EditRoomBottomSheet.show(context, index),
          child: room != null
              ? _buildRoomCell(context, room)
              : _buildEmptyCell(context),
        );
      },
    );
  }

  Widget _buildRoomCell(BuildContext context, RoomModel room) {
    final roomType = RoomType.values.firstWhere(
      (e) => e.name == room.roomType,
      orElse: () => RoomType.backyard,
    );

    return Container(
      decoration: BoxDecoration(
        color: context.appColors.gray4,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0.3),
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

  Widget _buildFloorTitle(BuildContext context, FloorState floorState) {
    final floorName = floorState.maybeWhen(
      loaded: (floor) => floor?.floorName ?? context.l10n.firstFloor,
      orElse: () => context.l10n.firstFloor,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Text(
            floorName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: context.appColors.fontGy1with90Opacity,
            ),
          ),
          Spacing.h2,
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              'chevron_left.png',
              width: AppSpacing.icon24,
              height: AppSpacing.icon24,
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
    return EditButton(
      onTap: () {
        debugPrint('Edit button tapped');
      },
    );
  }

  Widget _buildStats(BuildContext context, FloorState floorState) {
    final roomCount = floorState.maybeWhen(
      loaded: (floor) => floor?.rooms.length ?? 0,
      orElse: () => 0,
    );

    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.pad16,
        left: AppSpacing.pad16,
      ),
      child: Text(
        context.l10n.zonesCount(roomCount),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }

  Future<void> _checkAndShowDialog(BuildContext context, WidgetRef ref) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final hasShown = prefs.getBool(_dialogShownKey) ?? false;
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
