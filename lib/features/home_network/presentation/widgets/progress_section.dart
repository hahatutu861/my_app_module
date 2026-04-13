import 'package:flutter/material.dart';
import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/shared/utils/build_context_extension.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ProgressBar(),
          const SizedBox(height: 24),
          Text(
            context.l10n.networkReady,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: context.appColors.fontGy1with90Opacity,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Container(
          width: width,
          height: 8,
          decoration: BoxDecoration(
            color: context.appColors.brand6Normal,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
    );
  }
}
