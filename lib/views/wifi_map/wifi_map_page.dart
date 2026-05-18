import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:measure_size/measure_size.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/providers/shared_preferences_provider.dart';
import 'package:my_app_module/utils/build_context_extension.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_spacing_extension.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/utils/design/room_types.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/views/wifi_map/edit_room_bottom_sheet.dart';
import 'package:my_app_module/widgets/app_bubble_tip.dart';
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
    final floorViewModel = ref.read(floorViewModelProvider.notifier);
    ref.watch(allFloorsProvider);

    useEffect(() {
      _checkAndShowDialog(context, ref);
      Future.microtask(() {
        ref.read(floorViewModelProvider.notifier).loadFloor(floorId);
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
    final hideButtonSize = useState<Size?>(null);
    final bubbleSize = useState<Size?>(null);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _buildHeader(context, ref, hideButtonSize, bubbleSize, floorViewModel),
          _buildFloorTitle(context, floorViewModel),
          SizedBox(height: 16.h),
          _buildAutoSizeGrid(
            context,
            transformationController,
            floorViewModel,
            selectedIdx,
          ),
          _buildBottomBar(context, floorViewModel, selectedIdx),
        ],
      ),
    );
  }

  Widget _buildAutoSizeGrid(
    BuildContext context,
    TransformationController transformationController,
    FloorViewModel floorViewModel,
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
          height: totalGridHeight,
          child: InteractiveViewer(
            alignment: Alignment.topLeft,
            minScale: 1.0,
            maxScale: 2.5,
            boundaryMargin: EdgeInsets.zero,
            transformationController: transformationController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: minHorizontalPadding),
              child: _buildGrid(context, squareSize, floorViewModel, selectedIdx),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(
    BuildContext context,
    double squareSize,
    FloorViewModel floorViewModel,
    ValueNotifier<int?> selectedIdx,
  ) {
    final rooms = floorViewModel.currentRooms;

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
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cellHeight = constraints.maxHeight;
          final badgeHeight = cellHeight * 0.25;
          return Stack(
            children: [
              if (isSelected)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: context.appColors.fontGy1with90Opacity,
                        width: 1.2.w,
                      ),
                    ),
                  ),
                ),
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
                Positioned(
                  top: isSelected ? 0.2.w : 0,
                  right: isSelected ? 0.2.w : 0,
                  child: SizedBox(
                    height: badgeHeight,
                    child: AppBadge(
                      label: room.isGateway == true
                          ? context.l10n.router
                          : context.l10n.extender,
                    ),
                  ),
                ),
            ],
          );
        },
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
    FloorViewModel floorViewModel,
  ) {
    final floorName = floorViewModel.currentFloor?.floorName ?? context.l10n.firstFloor;

    return GestureDetector(
      onTap: () async {
        final currentFloorName = floorViewModel.currentFloor?.floorName;
        final newFloorName = await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              EditFloorNameDialog(initialFloorName: currentFloorName),
        );
        if (newFloorName != null && newFloorName.isNotEmpty) {
          await floorViewModel.updateFloorName(newFloorName);
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
            EditButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<Size?> hideButtonSize,
    ValueNotifier<Size?> bubbleSize,
    FloorViewModel floorViewModel,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBackButton(context),
          _buildHideButton(
            context,
            ref,
            hideButtonSize,
            bubbleSize,
            floorViewModel,
          ),
        ],
      ),
    );
  }

  Widget _buildHideButton(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<Size?> hideButtonSize,
    ValueNotifier<Size?> bubbleSize,
    FloorViewModel floorViewModel,
  ) {
    final isCurrentFloorEmpty = !floorViewModel.hasCurrentFloorRooms;
    final previousFloorWithRooms = floorViewModel.hasPreviousFloorWithRooms;

    if (!previousFloorWithRooms) {
      return const SizedBox.shrink();
    }

    final needsBubble = isCurrentFloorEmpty;
    final isHideButtonMeasured = hideButtonSize.value != null &&
        hideButtonSize.value!.width > 0 &&
        hideButtonSize.value!.height > 0;
    final isBubbleMeasured = bubbleSize.value != null &&
        bubbleSize.value!.width > 0 &&
        bubbleSize.value!.height > 0;

    final isReady = isHideButtonMeasured && (!needsBubble || isBubbleMeasured);

    if (!isReady) {
      return Opacity(
        opacity: 0,
        child: ExcludeSemantics(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MeasureSize(
                onChange: (size) => hideButtonSize.value = size,
                child: _buildHideButtonIcon(context, ref, floorViewModel),
              ),
              if (needsBubble)
                MeasureSize(
                  onChange: (size) => bubbleSize.value = size,
                  child: AppBubbleTip(
                    text: context.l10n.showPreviousFloorReference,
                    targetWidgetSize: const Size(32, 32),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        _buildHideButtonIcon(context, ref, floorViewModel),
        if (needsBubble)
          Positioned(
            top: hideButtonSize.value!.height + 4,
            left: hideButtonSize.value!.width - bubbleSize.value!.width,
            child: AppAnimatedBubbleTip(
              text: context.l10n.showPreviousFloorReference,
              targetWidgetSize: hideButtonSize.value,
            ),
          ),
      ],
    );
  }

  Widget _buildHideButtonIcon(
    BuildContext context,
    WidgetRef ref,
    FloorViewModel floorViewModel,
  ) {
    if (!floorViewModel.hasPreviousFloorWithRooms) {
      return const SizedBox.shrink();
    }

    final isCurrentFloorEmpty = !floorViewModel.hasCurrentFloorRooms;

    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        color: isCurrentFloorEmpty
            ? context.appColors.brand1Light
            : context.appColors.gray3,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: AppImage(
          'hide.png',
          width: 18.w,
          height: 18.w,
          color: isCurrentFloorEmpty
              ? context.appColors.brand6Normal
              : context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
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
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    FloorViewModel floorViewModel,
    ValueNotifier<int?> selectedIdx,
  ) {
    final isSelected = selectedIdx.value != null;
    if (isSelected) {
      final room = floorViewModel.getRoomByIndex(selectedIdx.value!);
      if (room == null) {
        return _buildStats(context, floorViewModel);
      }
      return _buildSelectedRoomBar(context, room, selectedIdx.value!);
    } else {
      return _buildStats(context, floorViewModel);
    }
  }

  Widget _buildSelectedRoomBar(
    BuildContext context,
    RoomModel room,
    int index,
  ) {
    final RoomType roomType = RoomType.values.firstWhere(
      (e) => e.name == room.roomType,
      orElse: () => RoomType.backyard,
    );

    return GestureDetector(
      onTap: () => EditRoomBottomSheet.show(context, index),
      behavior: HitTestBehavior.opaque,
      child: Padding(
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
            EditButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildStats(BuildContext context, FloorViewModel floorViewModel) {
    final roomCount = floorViewModel.currentRooms.length;

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
