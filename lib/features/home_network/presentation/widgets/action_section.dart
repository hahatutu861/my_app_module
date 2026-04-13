import 'package:flutter/material.dart';
import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/shared/utils/build_context_extension.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        bottom: MediaQuery.of(context).padding.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCompletionButton(context),
          const SizedBox(height: 12),
          _buildAddDeviceText(context),
        ],
      ),
    );
  }

  Widget _buildCompletionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: context.appColors.brand6Normal,
            foregroundColor: context.appColors.fontWh1with100Opacity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
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
