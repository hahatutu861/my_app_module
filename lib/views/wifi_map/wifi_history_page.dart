import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/models/speed_test_record.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';
import 'package:my_app_module/utils/build_context_extension.dart';
import 'package:my_app_module/utils/date_utils.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_media_query_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_provider.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_state.dart';
import 'package:my_app_module/widgets/wifi_speed_test_button.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/widgets/dialogs/delete_floor_confirm_dialog.dart';

class WifiHistoryPage extends HookConsumerWidget {
  final int? roomIndex;

  const WifiHistoryPage({super.key, this.roomIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusBarHeight = context.statusBarHeight;
    final floorState = ref.watch(floorViewModelProvider);
    final room = switch (floorState) {
      FloorStateLoaded(:final floor) when floor != null => _findRoom(
        floor,
        roomIndex,
      ),
      _ => null,
    };

    return Scaffold(
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: statusBarHeight),
              _buildHeader(context, room),
              Expanded(
                child: room == null
                    ? const SizedBox()
                    : _buildList(context, ref, room),
              ),
            ],
          ),
          _buildTestWifiButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, RoomModel? room) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: kToolbarHeight,
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.pad16.w),
          child: _buildBackButton(context),
        ),
        Padding(
          padding: EdgeInsets.only(left: AppSpacing.pad16.w),
          child: Text(
            context.l10n.wifiSpeedHistoryTitle(room?.roomName ?? ''),
            style: context.appTextStyles.titleWith90Opacity,
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      behavior: HitTestBehavior.opaque,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              'chevron_left.png',
              width: AppSpacing.icon24.w,
              height: AppSpacing.icon24.h,
              color: context.appColors.fontGy1with90Opacity,
            ),
            SizedBox(width: AppSpacing.gap4.w),
            Text(
              context.l10n.back,
              style: context.appTextStyles.bodyLargeWith90Opacity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, WidgetRef ref, RoomModel room) {
    final records = room.records;
    if (records.isEmpty) {
      return _buildEmpty(context);
    }
    final orderedIndices = List<int>.generate(
      records.length,
      (i) => i,
    ).reversed.toList();

    return ListView.builder(
      padding: EdgeInsets.only(top: AppSpacing.gap16.h),
      itemCount: orderedIndices.length,
      itemBuilder: (context, position) {
        final recordIndex = orderedIndices[position];
        return _HistoryListItem(
          room: room,
          record: records[recordIndex],
          recordIndex: recordIndex,
        );
      },
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.pad40.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.l10n.wifiSpeedHistoryEmptyTitle,
              textAlign: TextAlign.center,
              style: context.appTextStyles.bodyMediumWith90Opacity,
            ),
            SizedBox(height: AppSpacing.gap4.h),
            Text(
              context.l10n.wifiSpeedHistoryEmptyDescription,
              textAlign: TextAlign.center,
              style: context.appTextStyles.bodyMediumWith60Opacity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestWifiButton(BuildContext context, WidgetRef ref) {
    return Positioned(
      right: AppSpacing.pad16.w,
      bottom: 64.h,
      child: WifiSpeedTestButton(width: null, showShadow: true),
    );
  }
}

RoomModel? _findRoom(FloorModel floor, int? index) {
  if (floor.rooms.isEmpty) return null;
  return floor.rooms.firstWhere(
    (r) => r.index == index,
    orElse: () => floor.rooms.first,
  );
}

class _HistoryListItem extends ConsumerWidget {
  final RoomModel room;
  final SpeedTestRecord record;
  final int recordIndex;

  const _HistoryListItem({
    required this.room,
    required this.record,
    required this.recordIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: ValueKey('${room.index}-$recordIndex'),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          CustomSlidableAction(
            onPressed: (context) async {
              final confirmed = await showDialog<bool>(
                context: context,
                barrierDismissible: false,
                builder: (context) => DeleteConfirmDialog(
                  itemName:
                      '${_formatSpeed(record.speed)} '
                      '${context.l10n.wifiSpeedMbps}',
                ),
              );
              if (confirmed == true) {
                final updatedRecords = List<SpeedTestRecord>.from(room.records)
                  ..removeAt(recordIndex);
                ref
                    .read(floorViewModelProvider.notifier)
                    .updateRoom(
                      room.index,
                      room.copyWith(records: updatedRecords),
                    );
              }
            },
            backgroundColor: context.appColors.error6Normal,
            child: Center(
              child: Text(
                context.l10n.deleteFloor,
                style: context.appTextStyles.bodyMediumWith90Opacity.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppSpacing.pad16.w),
        decoration: BoxDecoration(
          color: context.appColors.fontWh1with100Opacity,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusIcon(context),
            SizedBox(width: AppSpacing.gap12.w),
            Expanded(child: _buildInfo(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(BuildContext context) {
    final level = _levelOf(record.speed);
    final icon = switch (level) {
      WifiSpeedLevel.good => 'good.png',
      WifiSpeedLevel.moderate => 'warning.png',
      WifiSpeedLevel.weak => 'weak.png',
    };
    final color = switch (level) {
      WifiSpeedLevel.good => context.appColors.lime6,
      WifiSpeedLevel.moderate => context.appColors.yellow6,
      WifiSpeedLevel.weak => context.appColors.warning6Normal,
    };
    return AppImage(
      icon,
      width: AppSpacing.icon24.w,
      height: AppSpacing.icon24.h,
      color: color,
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_formatSpeed(record.speed)} ${context.l10n.wifiSpeedMbps}',
          style: context.appTextStyles.bodyLargeWith90Opacity,
        ),
        SizedBox(height: AppSpacing.gap4.h),
        Text(
          formatDateTimeWithSeconds(record.timestamp),
          style: context.appTextStyles.bodyMediumWith60Opacity,
        ),
        SizedBox(height: AppSpacing.gap8.h),
        Row(
          children: [
            _buildInfoItem(
              context,
              'wifi.png',
              formatWifiConnectionInfo(
                WifiConnectionInfo(
                  band: record.band,
                  channel: record.channel,
                  rssi: record.rssi,
                ),
              ),
            ),
            SizedBox(width: AppSpacing.gap16.w),
            if ((record.deviceName?.isNotEmpty ?? false))
              _buildInfoItem(context, 'connected_to.png', record.deviceName!),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, String icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImage(
          icon,
          width: AppSpacing.icon16.w,
          height: AppSpacing.icon16.h,
          color: context.appColors.fontGy2with60Opacity,
        ),
        SizedBox(width: AppSpacing.s2.w),
        Text(text, style: context.appTextStyles.bodyMediumWith60Opacity),
      ],
    );
  }

  WifiSpeedLevel _levelOf(double speed) {
    if (speed >= 50) return WifiSpeedLevel.good;
    if (speed >= 10) return WifiSpeedLevel.moderate;
    return WifiSpeedLevel.weak;
  }

  String _formatSpeed(double speed) {
    return speed.toStringAsFixed(1);
  }
}
