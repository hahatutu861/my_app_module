import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        color: context.appColors.fontGy4with26Opacity,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: context.appColors.fontWh1with100Opacity,
            height: 1.0.h,
          ),
        ),
      ),
    );
  }
}
