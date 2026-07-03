import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/widgets/app_image.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.icon24.w,
      height: AppSpacing.icon24.w,
      decoration: BoxDecoration(
        color: context.appColors.gray3,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: AppImage(
          'edit.png',
          width: 14.w,
          height: 14.w,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }
}
