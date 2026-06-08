import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_module/utils/build_context_extension.dart';
import 'package:my_app_module/utils/design/app_button_style.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';

class ConnectWifiConfirmDialog extends StatelessWidget {
  const ConnectWifiConfirmDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const ConnectWifiConfirmDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 311.w,
        decoration: BoxDecoration(
          color: context.appColors.fontWh1with100Opacity,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 32.w, 24.w, 8.w),
              child: Text(
                context.l10n.connectToWifiConfirmTitle,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: context.appColors.fontGy1with90Opacity,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0.w, 24.w, 24.w),
              child: Text(
                context.l10n.connectToWifiConfirmDescription,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: context.appColors.fontGy2with60Opacity,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: context.appColors.gray3, width: 0.5.w),
                ),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        style: AppDialogButtonStyle.create(context),
                        child: Text(
                          context.l10n.cancel,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: context.appColors.fontGy1with90Opacity,
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 0.5.w,
                      thickness: 0.5.w,
                      color: context.appColors.gray3,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        style: AppDialogButtonStyle.create(context),
                        child: Text(
                          context.l10n.goToSettings,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: context.appColors.brand6Normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
