import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_media_query_extension.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/utils/design/room_types.dart';
import 'package:my_app_module/widgets/hint_text_field.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/viewmodels/wifi_map/edit_room_bottom_sheet_provider.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';
import 'package:my_app_module/models/room_model.dart';

import '../../utils/build_context_extension.dart';

class EditRoomBottomSheet extends HookConsumerWidget {
  final int? index;

  const EditRoomBottomSheet({super.key, this.index});

  static Future<bool?> show(BuildContext context, int index) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: context.appColors.fontWh1with100Opacity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      ),
      builder: (context) => EditRoomBottomSheet(index: index),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editRoomBottomSheetProvider);
    final viewModel = ref.read(editRoomBottomSheetProvider.notifier);
    final sheetHeight = context.dialogHeight;
    final roomNameController = useTextEditingController();
    final floorState = ref.watch(floorViewModelProvider);
    final hasRoom = switch (floorState) {
      FloorStateLoaded(:final floor) => floor?.rooms.any((r) => r.index == index) ?? false,
      _ => false,
    };

    useEffect(() {
      Future.microtask(() {
        if (index != null) {
          final floor = switch (floorState) {
            FloorStateLoaded(:final floor) => floor,
            _ => null,
          };
          if (floor != null) {
            final room = floor.rooms.where((r) => r.index == index).firstOrNull;
            viewModel.initWithRoom(room);
          }
        }
      });
      return null;
    }, [index]);

    if (roomNameController.text != state.roomName && state.roomName.isNotEmpty) {
      roomNameController.text = state.roomName;
    } else if (state.selectedRoom != null && roomNameController.text.isEmpty) {
      roomNameController.text = state.selectedRoom!.getDisplayName(context);
    }

    return SizedBox(
      height: sheetHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.pad16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNavBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(context),
                    _buildSubtitle(context),
                    _buildRoomDetailsLabel(context),
                    _buildInputField(context, roomNameController, ref),
                    _buildWifiApTitle(context),
                    _buildRadioGroup(context, state, viewModel),
                    _buildRoomTypeLabel(context),
                    _buildRoomGrid(context, state, viewModel),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSpacing.gap12.w),
            _buildButtons(context, ref, state, hasRoom, floorState, viewModel),
            SizedBox(height: AppSpacing.pad16.w),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: AppImage(
          'close.png',
          width: 24.w,
          height: 24.w,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      context.l10n.editNameAndType,
      style: context.appTextStyles.titleWith90Opacity,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.w),
      child: Text(
        context.l10n.addNameAndIconHint,
        style: context.appTextStyles.subtitleWith60Opacity,
      ),
    );
  }

  Widget _buildRoomDetailsLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.w),
      child: Text(
        context.l10n.roomDetailsLabel,
        style: context.appTextStyles.labelWith90Opacity,
      ),
    );
  }

  Widget _buildInputField(BuildContext context, TextEditingController roomNameController, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 8.w),
      padding: EdgeInsets.all(AppSpacing.pad16.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appColors.gray3,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.roomNameLabel,
            style: context.appTextStyles.bodyMediumWith90Opacity,
          ),
          SizedBox(height: 8.w),
          HintTextField(
            hintText: context.l10n.roomNameHint,
            controller: roomNameController,
            onChanged: (value) {
              ref.read(editRoomBottomSheetProvider.notifier).updateRoomName(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWifiApTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.w, left: 16.w, right: 16.w),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: context.l10n.wifiAccessPointQuestion,
              style: context.appTextStyles.bodyMediumWith90Opacity,
            ),
            TextSpan(text: ' ', style: context.appTextStyles.bodyMediumWith90Opacity),
            TextSpan(
              text: context.l10n.optional,
              style: context.appTextStyles.captionWith60Opacity.copyWith(
                color: context.appColors.warning6Normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioGroup(BuildContext context, EditRoomBottomSheetState state, EditRoomBottomSheetViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(top: 8.w),
      child: Row(
        children: [
          Expanded(
            child: _buildRadioItem(context, true, context.l10n.gateway, 'room_gateway.webp', state, viewModel),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _buildRadioItem(context, false, context.l10n.extender, 'room_extender.webp', state, viewModel),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioItem(BuildContext context, bool value, String label, String iconAsset, EditRoomBottomSheetState state, EditRoomBottomSheetViewModel viewModel) {
    final isSelected = state.isGateway == value;

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          viewModel.setIsGateway(null);
        } else {
          viewModel.setIsGateway(value);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? context.appColors.brand1Light
              : context.appColors.fontWh1with100Opacity,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              iconAsset,
              width: 24.w,
              height: 24.w,
              color: context.appColors.fontGy1with90Opacity,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: context.appTextStyles.captionWith90Opacity.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomTypeLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.w),
      child: Text(
        context.l10n.roomTypeLabel,
        style: context.appTextStyles.labelWith90Opacity,
      ),
    );
  }

  Widget _buildRoomGrid(BuildContext context, EditRoomBottomSheetState state, EditRoomBottomSheetViewModel viewModel) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8.w, bottom: 20.w),
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 85.75 / 96,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: RoomType.values.map((room) => _buildRoomItem(context, room, state, viewModel)).toList(),
      ),
    );
  }

  Widget _buildRoomItem(BuildContext context, RoomType room, EditRoomBottomSheetState state, EditRoomBottomSheetViewModel viewModel) {
    final isSelected = state.selectedRoom == room;

    return GestureDetector(
      onTap: () {
        viewModel.selectRoom(room, context);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? context.appColors.brand1Light
              : context.appColors.fontWh1with100Opacity,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              room.imagePath,
              width: 32.w,
              height: 32.w,
            ),
            SizedBox(height: 8.w),
            Text(
              room.getDisplayName(context),
              style: context.appTextStyles.captionWith90Opacity,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context, WidgetRef ref, EditRoomBottomSheetState state, bool hasRoom, FloorState floorState, EditRoomBottomSheetViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48.w,
            child: ElevatedButton(
              onPressed: () {
                if (index != null && state.selectedRoom != null) {
                  final roomName = state.roomName.isNotEmpty
                      ? state.roomName
                      : state.selectedRoom!.getDisplayName(context);
                  final existingRoom = switch (floorState) {
                    FloorStateLoaded(:final floor) => floor?.rooms
                        .where((r) => r.index == index)
                        .firstOrNull,
                    _ => null,
                  };
                  final room = RoomModel(
                    index: index!,
                    roomType: state.selectedRoom!.name,
                    roomName: roomName,
                    isGateway: state.isGateway,
                    createdAt: existingRoom?.createdAt ?? DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  ref.read(floorViewModelProvider.notifier).updateRoom(index!, room);
                  Navigator.of(context).pop(true);
                } else {
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.appColors.brand6Normal,
                foregroundColor: context.appColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                elevation: 0,
              ),
              child: Text(
                context.l10n.save,
                style: context.appTextStyles.buttonPrimary,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.gap16.w),
          if (hasRoom)
            SizedBox(
              width: double.infinity,
              height: 48.w,
              child: OutlinedButton(
                onPressed: () async {
                  await viewModel.deleteRoom(context, floorState, index!);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: context.appColors.error6Normal,
                    width: 1.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: Text(
                  context.l10n.deleteZoneRoom,
                  style: context.appTextStyles.buttonPrimary.copyWith(
                    color: context.appColors.error6Normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
