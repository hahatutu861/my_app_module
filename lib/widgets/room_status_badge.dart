import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/widgets/app_image.dart';

class RoomStatusBadge extends StatelessWidget {
  const RoomStatusBadge({
    super.key,
    required this.count,
    required this.iconPath,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final int count;
  final String iconPath;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.s10.w,
        vertical: AppSpacing.s3.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSpacing.radius3.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImage(
            iconPath,
            width: AppSpacing.gap16.w,
            height: AppSpacing.gap16.h,
            color: foregroundColor,
          ),
          SizedBox(width: AppSpacing.gap4.w),
          Text(
            count.toString(),
            style: context.appTextStyles.bodyMediumWith60Opacity.copyWith(
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
