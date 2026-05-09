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
import 'package:my_app_module/models/room_model.dart';

import '../../utils/build_context_extension.dart';

class EditRoomBottomSheet extends HookConsumerWidget {
  final int? index;

  const EditRoomBottomSheet({super.key, this.index});

  static Future<void> show(BuildContext context, int index) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
    final sheetHeight = context.screenHeight * 0.95;
    final roomNameController = useTextEditingController();
    final floorState = ref.watch(floorViewModelProvider);
    final hasRoom = floorState.maybeWhen(
      loaded: (floor) => floor?.rooms.any((r) => r.index == index),
      orElse: () => false,
    );

    useEffect(() {
      Future.microtask(() {
        if (index != null) {
          final floor = floorState.maybeWhen(
            loaded: (floor) => floor,
            orElse: () => null,
          );
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
            _buildTitle(context),
            _buildSubtitle(context),
            _buildRoomNameLabel(context),
            _buildInputField(context, roomNameController, ref),
            _buildRoomTypeLabel(context),
            Expanded(
              child: _buildRoomGrid(context, state, viewModel),
            ),
            _buildWifiApTitle(context),
            SizedBox(height: AppSpacing.pad24.w),
            _buildRadioGroup(context, state, viewModel),
            SizedBox(height: AppSpacing.pad24.w),
            _buildButtons(context, ref, state, hasRoom!),
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
    return Text(
      context.l10n.addNameAndIconHint,
      style: context.appTextStyles.subtitleWith60Opacity,
    );
  }

  Widget _buildRoomNameLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.w),
      child: Text(
        context.l10n.roomNameLabel,
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
      child: Center(
        child: HintTextField(
          hintText: context.l10n.roomNameHint,
          controller: roomNameController,
          onChanged: (value) {
            ref.read(editRoomBottomSheetProvider.notifier).updateRoomName(value);
          },
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
        childAspectRatio: 0.85,
        shrinkWrap: true,
        children: RoomType.values.map((room) => _buildRoomItem(context, room, state, viewModel)).toList(),
      ),
    );
  }

  Widget _buildWifiApTitle(BuildContext context) {
    return Text(
      context.l10n.wifiAccessPointQuestion,
      style: context.appTextStyles.labelWith90Opacity,
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
          borderRadius: BorderRadius.circular(6.r),
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

  Widget _buildRadioGroup(BuildContext context, EditRoomBottomSheetState state, EditRoomBottomSheetViewModel viewModel) {
    return Row(
      children: [
        _buildRadioItem(context, true, context.l10n.gateway, state, viewModel),
        SizedBox(width: 12.w),
        _buildRadioItem(context, false, context.l10n.extender, state, viewModel),
      ],
    );
  }

  Widget _buildRadioItem(BuildContext context, bool value, String label, EditRoomBottomSheetState state, EditRoomBottomSheetViewModel viewModel) {
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
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? context.appColors.brand6Normal
                : Colors.transparent,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            if (isSelected)
              Positioned(
                left: 0,
                top: 0,
                child: AppImage(
                  'check_filled.png',
                  width: 28.w,
                  height: 28.w,
                  color: context.appColors.brand6Normal,
                ),
              ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  label,
                  style: context.appTextStyles.bodyWith90Opacity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context, WidgetRef ref, EditRoomBottomSheetState state, bool hasRoom) {
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

                  final room = RoomModel(
                    index: index!,
                    roomType: state.selectedRoom!.name,
                    roomName: roomName,
                    isGateway: state.isGateway,
                  );
                  ref.read(floorViewModelProvider.notifier).updateRoom(index!, room);
                }
                Navigator.of(context).pop();
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
          SizedBox(height: AppSpacing.gap8.w),
          if (hasRoom)
            SizedBox(
              width: double.infinity,
              height: 48.w,
              child: OutlinedButton(
                onPressed: () {
                  ref.read(floorViewModelProvider.notifier).deleteRoom(index!);
                  Navigator.of(context).pop();
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
