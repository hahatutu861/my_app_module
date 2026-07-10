import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/providers/shared_preferences_provider.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';
import 'package:my_app_module/utils/build_context_extension.dart';
import 'package:my_app_module/utils/date_utils.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_provider.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_state.dart';
import 'package:my_app_module/views/wifi_map/edit_room_bottom_sheet.dart';
import 'package:my_app_module/views/wifi_map/wifi_speed_dialog.dart';
import 'package:my_app_module/views/wifi_map/display_settings_dialog.dart';
import 'package:my_app_module/views/wifi_map/wifi_speed_test_button.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/widgets/badge.dart';
import 'package:my_app_module/widgets/edit_button.dart';
import 'package:my_app_module/widgets/edit_floor_name_dialog.dart';
import 'package:my_app_module/widgets/room_status_badge.dart';
import 'package:my_app_module/widgets/wifi_map_dialog.dart';

import 'package:my_app_module/viewmodels/wifi_map/wifi_map_viewmodel_provider.dart';

import '../../utils/design/app_media_query_extension.dart';

extension SegmentedBarColorX on SegmentedBarColor {
  Color resolve(BuildContext context) {
    return switch (this) {
      SegmentedBarColor.gray3 => context.appColors.gray3,
      SegmentedBarColor.yellow6 => context.appColors.yellow6,
      SegmentedBarColor.lime6 => context.appColors.lime6,
      SegmentedBarColor.warning6Normal => context.appColors.warning6Normal,
    };
  }
}

class GridLayoutInfo {
  final double squareSize;
  final double gridHeight;
  final double horizontalPadding;
  final double screenWidth;

  const GridLayoutInfo({
    required this.squareSize,
    required this.gridHeight,
    required this.horizontalPadding,
    this.screenWidth = 0,
  });
}

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
    ref.watch(floorViewModelProvider);
    final floorViewModel = ref.read(floorViewModelProvider.notifier);
    ref.watch(allFloorsProvider);
    ref.watch(wifiMapViewModelProvider);

    useEffect(() {
      _checkAndShowDialog(context, ref);
      Future.microtask(() {
        ref.read(floorViewModelProvider.notifier).loadFloor(floorId);
      });
      return null;
    }, [floorId]);

    final statusBarHeight = context.statusBarHeight;
    final transformationController = useMemoized(() {
      final controller = TransformationController();
      return controller;
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _buildHeader(context, ref, floorViewModel),
          _buildFloorTitle(context, floorViewModel),
          SizedBox(height: 16.h),
          _buildAutoSizeGrid(
            context,
            ref,
            transformationController,
            floorViewModel,
          ),
          Expanded(child: _buildBottomBar(context, ref, floorViewModel)),
        ],
      ),
    );
  }

  GridLayoutInfo _calculateGridLayout(double screenWidth) {
    const int totalItemCount = 110;
    final double horizontalPadding = 16.w;
    final double availableWidth = screenWidth - horizontalPadding * 2;
    final double totalSpacingWidth = (crossAxisCount - 1) * spacing;
    final double squareSize =
        (availableWidth - totalSpacingWidth) / crossAxisCount;
    final int rowCount = (totalItemCount / crossAxisCount).ceil();
    final double totalGridHeight =
        rowCount * squareSize + (rowCount - 1) * spacing;

    return GridLayoutInfo(
      squareSize: squareSize,
      gridHeight: totalGridHeight,
      horizontalPadding: horizontalPadding,
    );
  }

  RoomFitContext _buildRoomFitContext(
    FloorViewModel floorViewModel,
    String? currentFloorId,
  ) {
    return floorViewModel.getRoomFitContext(currentFloorId);
  }

  void _handleRoomFitting(
    RoomFitContext context,
    FloorViewModel floorViewModel,
    TransformationController transformationController,
    GridLayoutInfo layout,
  ) {
    if (context.shouldFitToRooms && !floorViewModel.hasFittedToRooms) {
      final targetRooms = floorViewModel.getTargetRoomsForFitting(context);
      final shouldTranslate =
          context.hasCurrentRooms || context.shouldUseReference
          ? true
          : (context.hasNoRoomsAtAll ? false : true);
      if (targetRooms.isEmpty) {
        if (!shouldTranslate) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            floorViewModel.markFittedToRooms();
            transformationController.value = Matrix4.identity()
              ..scaleByDouble(2.5, 2.5, 1.0, 1.0);
          });
        }
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        floorViewModel.markFittedToRooms();
        final transform = floorViewModel.calculateFitTransform(
          roomsMap: targetRooms,
          viewportSize: Size(layout.screenWidth, layout.gridHeight),
          squareSize: layout.squareSize,
          spacing: WifiMapPage.spacing,
          padding: layout.horizontalPadding,
          shouldTranslate: shouldTranslate,
        );
        transformationController.value = transform;
      });
    }
  }

  Widget _buildAutoSizeGrid(
    BuildContext context,
    WidgetRef ref,
    TransformationController transformationController,
    FloorViewModel floorViewModel,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final layout = _calculateGridLayout(screenWidth);

        final fitContext = _buildRoomFitContext(floorViewModel, floorId);

        _handleRoomFitting(
          fitContext,
          floorViewModel,
          transformationController,
          GridLayoutInfo(
            squareSize: layout.squareSize,
            gridHeight: layout.gridHeight,
            horizontalPadding: layout.horizontalPadding,
            screenWidth: screenWidth,
          ),
        );

        return SizedBox(
          width: double.infinity,
          height: layout.gridHeight,
          child: InteractiveViewer(
            alignment: Alignment.topLeft,
            minScale: 1.0,
            maxScale: 2.5,
            boundaryMargin: EdgeInsets.zero,
            transformationController: transformationController,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: layout.horizontalPadding,
              ),
              child: _buildGrid(context, layout.squareSize, floorViewModel, floorViewModel.wifiViewMode),
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
    WifiViewMode viewMode,
  ) {
    final roomsMap = floorViewModel.roomsMap;
    final referenceIndices = floorViewModel.referenceIndices;

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
        final room = roomsMap[index];
        final isReference = referenceIndices.contains(index);
        final isSelected = floorViewModel.selectedRoomIndex == index;

        if (room != null) {
          return GestureDetector(
            onTap: () => floorViewModel.selectRoom(index),
            child: _buildRoomCell(context, room, isSelected, viewMode),
          );
        }

        if (isReference) {
          return GestureDetector(
            onTap: () => _editRoom(context, index, floorViewModel),
            child: _buildEmptyCell(context, color: context.appColors.gray4),
          );
        }

        return GestureDetector(
          onTap: () => _editRoom(context, index, floorViewModel),
          child: _buildEmptyCell(context),
        );
      },
    );
  }

  Future<void> _editRoom(
    BuildContext context,
    int index,
    FloorViewModel floorViewModel,
  ) async {
    final saved = await EditRoomBottomSheet.show(context, index);
    if (saved == true) {
      floorViewModel.selectRoom(index);
    }
  }

  Widget _buildRoomCell(BuildContext context, RoomModel room, bool isSelected, WifiViewMode viewMode) {
    final speedLevel = room.speedLevel;
    if (speedLevel == null) {
      return _buildRoomCellPlaceholder(context, room, isSelected);
    }
    return _buildRoomCellWithSpeed(context, room, isSelected, speedLevel, viewMode);
  }

  Widget _buildRoomCellPlaceholder(
    BuildContext context,
    RoomModel room,
    bool isSelected,
  ) {
    final roomType = room.roomTypeEnum;
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

  Widget _buildRoomCellWithSpeed(
    BuildContext context,
    RoomModel room,
    bool isSelected,
    WifiSpeedLevel speedLevel,
    WifiViewMode viewMode,
  ) {
    final roomType = room.roomTypeEnum;
    final backgroundColor = switch (speedLevel) {
      WifiSpeedLevel.good => context.appColors.lime6,
      WifiSpeedLevel.moderate => context.appColors.yellow6,
      WifiSpeedLevel.weak => context.appColors.warning6Normal,
    };
    final foregroundColor = context.appColors.fontWh1with100Opacity;
    final speedText = room.records.last.speed.toStringAsFixed(1);
    final showSpeed = viewMode == WifiViewMode.speed;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cellHeight = constraints.maxHeight;
          final badgeHeight = cellHeight * 0.25;
          return Stack(
            children: [
              if (room.isGateway != null)
                Positioned(
                  top: isSelected ? 1.2.w : 0,
                  right: isSelected ? 1.2.w : 0,
                  child: SizedBox(
                    height: badgeHeight,
                    child: AppBadge(
                      label: room.isGateway == true
                          ? context.l10n.router
                          : context.l10n.extender,
                    ),
                  ),
                ),
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.8.r),
                        border: Border.all(
                          color: context.appColors.fontWh1with100Opacity,
                          width: 1.2.w,
                        ),
                      ),
                    ),
                  ),
                ),
              FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: 80.w,
                  height: 80.w,
                  child: Stack(
                    children: [
                      if (showSpeed)
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              speedText,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: foregroundColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      Positioned(
                        bottom: isSelected ? 5.8.w : 4.w,
                        right: isSelected ? 5.8.w : 4.w,
                        child: AppImage(
                          roomType.imagePath,
                          width: 24.w,
                          height: 24.w,
                          color: context.appColors.fontWh2with55Opacity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyCell(BuildContext context, {Color? color}) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? context.appColors.gray1,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }

  Widget _buildFloorTitle(BuildContext context, FloorViewModel floorViewModel) {
    final floorName =
        floorViewModel.currentFloor?.floorName ?? context.l10n.firstFloor;

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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  floorName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: context.appColors.fontGy1with90Opacity,
                  ),
                ),
                SizedBox(width: AppSpacing.s2.w),
                EditButton(),
              ],
            ),
            floorViewModel.currentFloor?.rooms.isNotEmpty == true
                ? Text(
                    context.l10n.wifiMapUnitMbps,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: context.appColors.fontGy2with60Opacity,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    WidgetRef ref,
    FloorViewModel floorViewModel,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBackButton(context),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (floorViewModel.currentFloor?.rooms.isNotEmpty == true)
                GestureDetector(
                  onTap: () => WifiSpeedDialog.show(context),
                  child: AppImage(
                    'info.png',
                    width: 24.w,
                    height: 24.w,
                    color: context.appColors.fontGy1with90Opacity,
                  ),
                ),
              if (floorViewModel.currentFloor?.rooms.isNotEmpty == true)
                SizedBox(width: 8.w),
              GestureDetector(
                onTap: () => DisplaySettingsDialog.show(context),
                child: AppImage(
                  'tune.webp',
                  width: 24.w,
                  height: 24.w,
                  color: context.appColors.fontGy1with90Opacity,
                ),
              ),
            ],
          ),
        ],
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
          SizedBox(width: AppSpacing.s8.w),
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
    WidgetRef ref,
    FloorViewModel floorViewModel,
  ) {
    final isSelected = floorViewModel.selectedRoomIndex != null;
    if (isSelected) {
      final room = floorViewModel.getRoomByIndex(
        floorViewModel.selectedRoomIndex!,
      );
      if (room == null) {
        return _buildStats(context, floorViewModel);
      }
      return _buildSelectedRoomBar(
        context,
        ref,
        room,
        floorViewModel.selectedRoomIndex!,
        floorViewModel,
      );
    } else {
      return _buildStats(context, floorViewModel);
    }
  }

  Widget _buildSelectedRoomBar(
    BuildContext context,
    WidgetRef ref,
    RoomModel room,
    int index,
    FloorViewModel floorViewModel,
  ) {
    final isTesting = ref.watch(
      wifiSpeedViewModelProvider.select((state) => state.isTesting),
    );
    final bandInfo = (isTesting || room.records.isEmpty)
        ? '--'
        : formatWifiConnectionInfo(
            WifiConnectionInfo(
              band: room.records.last.band,
              channel: room.records.last.channel,
              rssi: room.records.last.rssi,
            ),
          );
    final deviceName =
        (isTesting ||
            room.records.isEmpty ||
            (room.records.last.deviceName?.isEmpty ?? true))
        ? '--'
        : room.records.last.deviceName!;

    return Container(
      color: context.appColors.fontWh1with100Opacity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectedRoomTopRow(context, room, index, floorViewModel),
            _buildSpeedRow(context, ref, room),
            SizedBox(height: 7.h),
            _buildSegmentedBar(context, ref, room),
            SizedBox(height: 7.h),
            _buildInfoRow(
              context,
              context.l10n.wifiSpeedBand,
              bandInfo,
              'wifi.png',
              hideIcon: bandInfo == '--',
              valueColor: bandInfo == '--'
                  ? context.appColors.fontGy1with90Opacity
                  : null,
            ),
            SizedBox(height: 8.h),
            _buildInfoRow(
              context,
              context.l10n.wifiSpeedConnectedTo,
              deviceName,
              'connected_to.png',
              hideIcon: deviceName == '--',
              valueColor: deviceName == '--'
                  ? context.appColors.fontGy1with90Opacity
                  : null,
            ),
            SizedBox(height: 16.h),
            _buildActionButtons(context, ref, index),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedRoomTopRow(
    BuildContext context,
    RoomModel room,
    int index,
    FloorViewModel floorViewModel,
  ) {
    final roomType = room.roomTypeEnum;
    final displayTime = room.updatedAt ?? room.createdAt;
    final timeText = displayTime != null ? formatDateTime(displayTime) : '';

    return GestureDetector(
      onTap: () => _editRoom(context, index, floorViewModel),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppImage(
                  roomType.imagePath,
                  width: 20.w,
                  height: 20.w,
                  color: context.appColors.fontGy1with90Opacity,
                ),
                SizedBox(width: 4.w),
                Text(
                  room.roomName,
                  style: context.appTextStyles.titleWith90Opacity.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 4.w),
                const EditButton(),
              ],
            ),
            Text(
              timeText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: context.appColors.fontGy2with60Opacity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeedRow(BuildContext context, WidgetRef ref, RoomModel room) {
    final speedState = ref.watch(wifiSpeedViewModelProvider);
    final latestSpeed = speedState.isTesting
        ? '--'
        : (room.records.isNotEmpty
              ? room.records.last.speed.toStringAsFixed(1)
              : '--');

    final isTesting = speedState.isTesting;
    final hasSpeed = room.records.isNotEmpty;
    final statusColor = (isTesting || !hasSpeed)
        ? context.appColors.fontGy1with90Opacity
        : (room.speedLevel == WifiSpeedLevel.good
              ? context.appColors.lime6
              : (room.speedLevel == WifiSpeedLevel.moderate
                    ? context.appColors.yellow6
                    : context.appColors.warning6Normal));
    final statusText = (isTesting || !hasSpeed)
        ? '--'
        : (room.speedLevel == WifiSpeedLevel.good
              ? context.l10n.wifiSpeedGoodStatus
              : (room.speedLevel == WifiSpeedLevel.moderate
                    ? context.l10n.wifiSpeedModerateStatus
                    : context.l10n.wifiSpeedWeakStatus));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              latestSpeed,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w500,
                color: context.appColors.fontGy1with90Opacity,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              context.l10n.wifiSpeedMbps,
              style: TextStyle(
                fontSize: 14.sp,
                color: context.appColors.fontGy1with90Opacity,
              ),
            ),
          ],
        ),
        Row(
          children: [
            if (!isTesting && hasSpeed) ...[
              AppImage(
                room.speedStatusIcon,
                width: 16.w,
                height: 16.w,
                color: statusColor,
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              statusText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: statusColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSegmentedBar(
    BuildContext context,
    WidgetRef ref,
    RoomModel room,
  ) {
    final isTesting = ref.watch(
      wifiSpeedViewModelProvider.select((state) => state.isTesting),
    );
    final barColors = ref
        .read(wifiSpeedViewModelProvider.notifier)
        .segmentedBarColors(isTesting ? null : room.speedLevel);

    return Row(
      children: [
        for (var i = 0; i < barColors.length; i++) ...[
          if (i > 0) SizedBox(width: 8.w),
          Expanded(
            child: Container(
              height: 4.h,
              decoration: BoxDecoration(
                color: barColors[i].resolve(context),
                borderRadius: BorderRadius.circular(200.r),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    String iconName, {
    bool hideIcon = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.appTextStyles.bodyLargeWith90Opacity.copyWith(
            fontSize: 14.sp,
          ),
        ),
        Row(
          children: [
            if (!hideIcon) ...[
              AppImage(
                iconName,
                width: 16.w,
                height: 16.w,
                color: context.appColors.fontGy2with60Opacity,
              ),
              SizedBox(width: 2.w),
            ],
            Text(
              value,
              style: valueColor != null
                  ? context.appTextStyles.bodyMediumWith60Opacity.copyWith(
                      color: valueColor,
                    )
                  : context.appTextStyles.bodyMediumWith60Opacity,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, int index) {
    final isTesting = ref.watch(
      wifiSpeedViewModelProvider.select((state) => state.isTesting),
    );

    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: isTesting
              ? null
              : () => context.push('/wifi-history?roomIndex=$index'),
          icon: AppImage(
            'history.png',
            width: 22.w,
            height: 22.h,
            color: isTesting
                ? context.appColors.fontGy4with26Opacity
                : context.appColors.fontGy1with90Opacity,
          ),
          label: Text(
            context.l10n.wifiSpeedHistory,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isTesting
                  ? context.appColors.fontGy4with26Opacity
                  : context.appColors.fontGy1with90Opacity,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: isTesting
                ? context.appColors.gray2
                : context.appColors.gray3,
            foregroundColor: isTesting
                ? context.appColors.fontGy4with26Opacity
                : context.appColors.fontGy1with90Opacity,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        const Expanded(child: WifiSpeedTestButton()),
      ],
    );
  }

  Widget _buildStats(BuildContext context, FloorViewModel floorViewModel) {
    final roomCount = floorViewModel.currentRooms.length;
    final counts = floorViewModel.roomSpeedLevelCounts;
    final hasTestedRoom =
        (counts[WifiSpeedLevel.good] ?? 0) +
            (counts[WifiSpeedLevel.moderate] ?? 0) +
            (counts[WifiSpeedLevel.weak] ?? 0) >
        0;
    final hintText = hasTestedRoom
        ? context.l10n.wifiMapStatsWalkHint
        : context.l10n.wifiMapStatsClickZonesHint;

    return Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.pad16.w,
        left: AppSpacing.pad16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.zonesCount(roomCount),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: context.appColors.fontGy1with90Opacity,
            ),
          ),
          SizedBox(height: AppSpacing.gap8.h),
          _buildStatusBadges(context, floorViewModel),
          if (roomCount > 0) ...[
            SizedBox(height: AppSpacing.gap16.h),
            Text(
              context.l10n.wifiMapStatsTips,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: context.appColors.fontGy1with90Opacity,
              ),
            ),
            SizedBox(height: AppSpacing.gap4.h),
            Text(
              hintText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: context.appColors.fontGy2with60Opacity,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadges(
    BuildContext context,
    FloorViewModel floorViewModel,
  ) {
    final Map<WifiSpeedLevel?, int> counts =
        floorViewModel.roomSpeedLevelCounts;

    final List<({WifiSpeedLevel? level, String icon, Color bg, Color fg})>
    configs = [
      (
        level: WifiSpeedLevel.good,
        icon: 'good.png',
        bg: context.appColors.lime1,
        fg: context.appColors.lime6,
      ),
      (
        level: WifiSpeedLevel.moderate,
        icon: 'warning.webp',
        bg: context.appColors.yellow1,
        fg: context.appColors.yellow6,
      ),
      (
        level: WifiSpeedLevel.weak,
        icon: 'weak.webp',
        bg: context.appColors.warning1Light,
        fg: context.appColors.warning6Normal,
      ),
      (
        level: null,
        icon: 'no_result.png',
        bg: context.appColors.gray1,
        fg: context.appColors.fontGy2with60Opacity,
      ),
    ];

    final List<Widget> badges = [];
    for (final config in configs) {
      final int count = counts[config.level] ?? 0;
      if (count <= 0) continue;
      if (badges.isNotEmpty) {
        badges.add(SizedBox(width: AppSpacing.gap8.w));
      }
      badges.add(
        RoomStatusBadge(
          count: count,
          iconPath: config.icon,
          backgroundColor: config.bg,
          foregroundColor: config.fg,
        ),
      );
    }

    return Row(mainAxisSize: MainAxisSize.min, children: badges);
  }

  Future<void> _checkAndShowDialog(BuildContext context, WidgetRef ref) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final bool hasShown = prefs.getBool(_dialogShownKey) ?? false;
    if (!hasShown) {
      await prefs.setBool(_dialogShownKey, true);
      if (!context.mounted) return;
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
