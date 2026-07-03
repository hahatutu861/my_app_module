import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_media_query_extension.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/widgets/app_image.dart';

import '../../utils/build_context_extension.dart';

class WifiSpeedDialog extends StatelessWidget {
  const WifiSpeedDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: context.appColors.popupTextBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      ),
      builder: (context) => const WifiSpeedDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dialogHeight,
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
                    _buildTitleSection(context),
                    SizedBox(height: 12.w),
                    _buildSignalLevels(context),
                  ],
                ),
              ),
            ),
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
        child: AppImage('close.png', width: 24.w, height: 24.w),
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.wifiSpeedDialogTitle,
          style: context.appTextStyles.titleWith90Opacity,
        ),
        SizedBox(height: AppSpacing.gap8.w),
        Text(
          context.l10n.wifiSpeedDialogSubtitle,
          style: context.appTextStyles.subtitleWith60Opacity,
        ),
      ],
    );
  }

  Widget _buildSignalLevels(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSignalLevel(
          context,
          icon: 'good.png',
          label: context.l10n.wifiSpeedGood,
          color: context.appColors.lime6,
          description: context.l10n.wifiSpeedGoodDescription,
        ),
        SizedBox(height: 12.w),
        _buildSignalLevel(
          context,
          icon: 'warning.png',
          label: context.l10n.wifiSpeedModerate,
          color: context.appColors.yellow6,
          description: context.l10n.wifiSpeedModerateDescription,
        ),
        SizedBox(height: 12.w),
        _buildSignalLevel(
          context,
          icon: 'weak.png',
          label: context.l10n.wifiSpeedWeak,
          color: context.appColors.warning6Normal,
          description: context.l10n.wifiSpeedWeakDescription,
        ),
        SizedBox(height: 12.w),
        _buildExtenderHint(context),
      ],
    );
  }

  Widget _buildSignalLevel(
    BuildContext context, {
    required String icon,
    required String label,
    required Color color,
    required String description,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(right: 4.w, bottom: 2.h),
              child: AppImage(icon, width: 16.w, height: 16.w, color: color),
            ),
          ),
          TextSpan(
            text: label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          TextSpan(
            text: description,
            style: context.appTextStyles.subtitleWith60Opacity,
          ),
        ],
      ),
    );
  }

  Widget _buildExtenderHint(BuildContext context) {
    return Text(
      context.l10n.wifiSpeedExtenderHint,
      style: context.appTextStyles.subtitleWith60Opacity,
    );
  }
}
