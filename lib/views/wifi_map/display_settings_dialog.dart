import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import '../../utils/build_context_extension.dart';

class DisplaySettingsDialog extends ConsumerWidget {
  const DisplaySettingsDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.appColors.popupTextBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      ),
      builder: (context) => const DisplaySettingsDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(floorViewModelProvider);
    final viewModel = ref.read(floorViewModelProvider.notifier);
    final viewMode = state is FloorStateLoaded ? state.wifiViewMode : WifiViewMode.quality;
    final isReferenceEnabled = state is FloorStateLoaded ? state.isReferenceEnabled : false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.pad16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNavBar(context),
          _buildTitle(context),
          SizedBox(height: 16.h),
          _buildViewModeSection(context, viewMode, viewModel),
          SizedBox(height: 40.h),
          _buildReferenceSection(context, isReferenceEnabled, viewModel),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(vertical: AppSpacing.pad16.h),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: AppImage(
          'close.png',
          width: AppSpacing.icon24.w,
          height: AppSpacing.icon24.w,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      context.l10n.display,
      style: context.appTextStyles.titleWith90Opacity,
    );
  }

  Widget _buildViewModeSection(
    BuildContext context,
    WifiViewMode currentMode,
    FloorViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.viewMode,
          style: context.appTextStyles.labelWith90Opacity,
        ),
        SizedBox(height: 8.h),
        _buildOptionItem(
          context,
          title: context.l10n.viewModeQuality,
          description: context.l10n.viewModeQualityDescription,
          isSelected: currentMode == WifiViewMode.quality,
          onTap: () => viewModel.setWifiViewMode(WifiViewMode.quality),
          illustration: _buildQualityIllustration(context),
        ),
        SizedBox(height: 8.h),
        _buildOptionItem(
          context,
          title: context.l10n.viewModeSpeed,
          description: context.l10n.viewModeSpeedDescription,
          isSelected: currentMode == WifiViewMode.speed,
          onTap: () => viewModel.setWifiViewMode(WifiViewMode.speed),
          illustration: _buildSpeedIllustration(context),
        ),
      ],
    );
  }

  Widget _buildOptionItem(
    BuildContext context, {
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
    required Widget illustration,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.pad16.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? context.appColors.brand6Normal : Colors.transparent,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.appTextStyles.bodyLargeWith90Opacity,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        style: context.appTextStyles.bodyMediumWith60Opacity,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                illustration,
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              left: 0,
              top: 0,
              child: AppImage(
                'check_filled.png',
                width: 28.w,
                height: 28.w,
                color: context.appColors.brand6Normal,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQualityIllustration(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildColorBlock(context, context.appColors.lime6),
            SizedBox(width: 2.w),
            _buildColorBlock(context, context.appColors.yellow6),
            SizedBox(width: 2.w),
            _buildColorBlock(context, context.appColors.lime6),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            _buildColorBlock(context, context.appColors.yellow6),
            SizedBox(width: 2.w),
            _buildColorBlock(context, context.appColors.lime6),
            SizedBox(width: 2.w),
            _buildColorBlock(context, context.appColors.warning6Normal),
          ],
        ),
      ],
    );
  }

  Widget _buildSpeedIllustration(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildSpeedBlock(context, '118', context.appColors.lime2),
            SizedBox(width: 2.w),
            _buildSpeedBlock(context, '32', context.appColors.yellow2),
            SizedBox(width: 2.w),
            _buildSpeedBlock(context, '67', context.appColors.lime2),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            _buildSpeedBlock(context, '24', context.appColors.yellow2),
            SizedBox(width: 2.w),
            _buildSpeedBlock(context, '209', context.appColors.lime2),
            SizedBox(width: 2.w),
            _buildSpeedBlock(context, '2', context.appColors.warning2Focus),
          ],
        ),
      ],
    );
  }

  Widget _buildColorBlock(BuildContext context, Color color) {
    return Container(
      width: 28.w,
      height: 28.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.r),
      ),
    );
  }

  Widget _buildSpeedBlock(BuildContext context, String speed, Color bgColor) {
    final textColor = bgColor == context.appColors.lime2
        ? context.appColors.lime9
        : bgColor == context.appColors.yellow2
            ? context.appColors.yellow9
            : context.appColors.warning9;

    return Container(
      width: 28.w,
      height: 28.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(3.r),
      ),
      alignment: Alignment.center,
      child: Text(
        speed,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildReferenceSection(
    BuildContext context,
    bool isEnabled,
    FloorViewModel viewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.showPreviousFloorReference,
                style: context.appTextStyles.labelWith90Opacity,
              ),
              SizedBox(height: 4.h),
              Text(
                context.l10n.showPreviousFloorReferenceDescription,
                style: context.appTextStyles.bodyMediumWith60Opacity,
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () => viewModel.toggleReference(),
          child: AppImage(
            isEnabled ? 'switch_on.webp' : 'switch_off.webp',
            width: 45.w,
            height: 28.w,
          ),
        ),
      ],
    );
  }
}
