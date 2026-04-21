import 'package:flutter/material.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_spacing_extension.dart';
import 'package:my_app_module/utils/build_context_extension.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.pad16,
        right: AppSpacing.pad16,
        top: AppSpacing.pad20,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.pad20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCompletionButton(context),
          Spacing.v12,
          _buildAddDeviceText(context),
        ],
      ),
    );
  }

  Widget _buildCompletionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad24),
      child: SizedBox(
        width: double.infinity,
        height: AppSpacing.buttonHeight,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: context.appColors.brand6Normal,
            foregroundColor: context.appColors.fontWh1with100Opacity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
          ),
          child: Text(
            context.l10n.installationCompleted,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: context.appColors.fontWh1with100Opacity,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddDeviceText(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Text(
        context.l10n.addOtherEquipment,
        style: TextStyle(fontSize: 16, color: context.appColors.brand6Normal),
        textAlign: TextAlign.center,
      ),
    );
  }
}
