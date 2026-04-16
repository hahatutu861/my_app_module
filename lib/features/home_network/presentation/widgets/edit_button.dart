import 'package:flutter/material.dart';
import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/shared/ui/widgets/app_image.dart';

import '../../../../core/design/app_spacing.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSpacing.icon24,
        height: AppSpacing.icon24,
        decoration: BoxDecoration(
          color: context.appColors.gray3,
          shape: BoxShape.circle,
        ),
        child: const Center(child: AppImage('edit.png', width: 14, height: 14)),
      ),
    );
  }
}
