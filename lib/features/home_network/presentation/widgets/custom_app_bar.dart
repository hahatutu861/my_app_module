import 'package:flutter/material.dart';
import '../../../../core/design/app_color_extension.dart';
import '../../../../shared/bridges/pigeon_generated.dart';
import '../../../../shared/ui/widgets/app_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: context.appColors.fontWh1with100Opacity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: _buildBackButton(context)),
          Expanded(child: _buildCloseButton(context)),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppImage(
          'chevron_left.png',
          width: 24,
          height: 24,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await AndroidNativeApi().closeFlutterActivity();
        } catch (e) {
          debugPrint('关闭 Activity 失败: $e');
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Align(
        alignment: Alignment.centerRight,
        child: AppImage(
          'close.png',
          width: 24,
          height: 24,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }
}
