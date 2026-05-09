import 'package:flutter/material.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/widgets/app_image.dart';

import 'package:my_app_module/utils/design/app_spacing.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.icon24,
      height: AppSpacing.icon24,
      decoration: BoxDecoration(
        color: context.appColors.gray3,
        shape: BoxShape.circle,
      ),
      child: const Center(child: AppImage('edit.png', width: 14, height: 14)),
    );
  }
}
