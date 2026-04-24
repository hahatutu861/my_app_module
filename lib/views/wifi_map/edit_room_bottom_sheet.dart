import 'package:flutter/material.dart';
import 'package:my_app_module/utils/design/app_colors.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_media_query_extension.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/room_types.dart';
import 'package:my_app_module/widgets/app_image.dart';

class EditRoomBottomSheet extends StatefulWidget {
  const EditRoomBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 10,
      builder: (context) => const EditRoomBottomSheet(),
    );
  }

  @override
  State<EditRoomBottomSheet> createState() => _EditRoomBottomSheetState();
}

class _EditRoomBottomSheetState extends State<EditRoomBottomSheet> {
  RoomType? _selectedRoom;
  bool _isZone = true;

  @override
  Widget build(BuildContext context) {
    final sheetHeight = context.screenHeight * 0.95;

    return Container(
      height: sheetHeight,
      decoration: BoxDecoration(
        color: context.appColors.fontWh1with100Opacity,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildNavBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.pad16),
                  Text(
                    'Edit Zone/Room',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: context.appColors.fontWh1with100Opacity,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.pad16),
                  _buildInputField(),
                  const SizedBox(height: AppSpacing.pad24),
                  _buildRoomGrid(),
                  const SizedBox(height: AppSpacing.pad24),
                  _buildRadioGroup(),
                  const SizedBox(height: AppSpacing.pad24),
                  _buildButtons(),
                  const SizedBox(height: AppSpacing.pad16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar() {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: AppImage(
              'close.png',
              width: 24,
              height: 24,
            ),
          ),
          const Spacer(),
          Text(
            'Title text',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: context.appColors.fontWh1with100Opacity,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(AppColors.gray5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: "e.g. 'For Web Server'",
            hintStyle: TextStyle(
              color: context.appColors.fontGy2with60Opacity,
              fontSize: 14,
            ),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildRoomGrid() {
    return Column(
      children: [
        _buildGridRow(RoomType.values.sublist(0, 4)),
        const SizedBox(height: AppSpacing.gap8),
        _buildGridRow(RoomType.values.sublist(4, 8)),
        const SizedBox(height: AppSpacing.gap8),
        _buildGridRow(RoomType.values.sublist(8, 12)),
        const SizedBox(height: AppSpacing.gap8),
        _buildGridRow(RoomType.values.sublist(12, 16)),
        const SizedBox(height: AppSpacing.gap8),
        _buildGridRow(RoomType.values.sublist(16, 18)),
      ],
    );
  }

  Widget _buildGridRow(List<RoomType> rooms) {
    return Row(
      children: rooms.map((room) => Expanded(child: _buildRoomItem(room))).toList(),
    );
  }

  Widget _buildRoomItem(RoomType room) {
    final isSelected = _selectedRoom == room;
    final isOffice = room == RoomType.office;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRoom = room;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: isOffice && isSelected
              ? const Color(AppColors.brand1Light)
              : const Color(AppColors.white),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                AppImage(
                  room.imagePath,
                  width: 32,
                  height: 32,
                ),
                if (isSelected)
                  const Positioned(
                    right: 0,
                    bottom: 0,
                    child: AppImage(
                      'assets/images/check_filled.png',
                      width: 12,
                      height: 12,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              room.getDisplayName(context),
              style: TextStyle(
                fontSize: 11,
                color: context.appColors.fontWh1with100Opacity,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioGroup() {
    return Row(
      children: [
        _buildRadioItem(true, 'Zone'),
        const SizedBox(width: 12),
        _buildRadioItem(false, 'Room'),
      ],
    );
  }

  Widget _buildRadioItem(bool value, String label) {
    final isSelected = _isZone == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isZone = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? const Color(AppColors.brand6Normal)
                : const Color(AppColors.gray5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(AppColors.brand6Normal)
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color(AppColors.brand6Normal)
                      : const Color(AppColors.gray5),
                  width: 1.5,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: context.appColors.fontWh1with100Opacity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(AppColors.brand6Normal),
              foregroundColor: const Color(AppColors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.gap8),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(AppColors.error6Normal),
              side: const BorderSide(
                color: Color(AppColors.error6Normal),
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text(
              'Delete this zone/room',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
