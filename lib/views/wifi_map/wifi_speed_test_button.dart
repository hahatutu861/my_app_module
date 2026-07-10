import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';
import 'package:my_app_module/utils/build_context_extension.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_provider.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_state.dart';
import 'package:my_app_module/widgets/app_image.dart';
import 'package:my_app_module/widgets/connect_wifi_confirm_dialog.dart';

class WifiSpeedTestButton extends ConsumerWidget {
  final double? width;
  final bool showShadow;

  const WifiSpeedTestButton({
    super.key,
    this.width = double.infinity,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wifiSpeedViewModelProvider);
    final viewModel = ref.read(wifiSpeedViewModelProvider.notifier);
    final current = state.isTesting
        ? _buildTestingButton(context, state, viewModel)
        : _buildIdleButton(context, viewModel);
    if (width != null) {
      return SizedBox(width: width, child: current);
    }
    if (!state.isTesting) {
      return current;
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0,
          child: IgnorePointer(
            child: _buildIdleButton(context, viewModel),
          ),
        ),
        Positioned.fill(child: current),
      ],
    );
  }

  Widget _buildIdleButton(BuildContext context, WifiSpeedViewModel viewModel) {
    final button = ElevatedButton(
      onPressed: () => _handleTap(context, viewModel),
      style: ElevatedButton.styleFrom(
        backgroundColor: context.appColors.brand6Normal,
        foregroundColor: context.appColors.white,
        elevation: 0,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage(
            'speed.png',
            width: 24.w,
            height: 24.w,
            color: context.appColors.white,
          ),
          SizedBox(width: 4.w),
          Text(
            context.l10n.wifiSpeedTest,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );

    if (!showShadow) return button;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: _shadow(context),
      ),
      child: button,
    );
  }

  Widget _buildTestingButton(
    BuildContext context,
    WifiSpeedState state,
    WifiSpeedViewModel viewModel,
  ) {
    final stage = 5 - state.progress;
    final progress = (stage * 0.2).clamp(0.0, 1.0);
    return GestureDetector(
      onTap: () => viewModel.stopSpeedTest(),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: context.appColors.brand6Normal,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: _shadow(context),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    color: context.appColors.white.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                context.l10n.wifiSpeedTesting(state.progress + 1),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: context.appColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BoxShadow>? _shadow(BuildContext context) {
    if (!showShadow) return null;
    return [
      BoxShadow(
        color: context.appColors.black.withValues(alpha: 0.10),
        blurRadius: 5.r,
        spreadRadius: -3.r,
        offset: Offset(0, 5.h),
      ),
      BoxShadow(
        color: context.appColors.black.withValues(alpha: 0.06),
        blurRadius: 10.r,
        spreadRadius: 1.r,
        offset: Offset(0, 8.h),
      ),
      BoxShadow(
        color: context.appColors.black.withValues(alpha: 0.05),
        blurRadius: 14.r,
        spreadRadius: 2.r,
        offset: Offset(0, 3.h),
      ),
    ];
  }

  Future<void> _handleTap(
    BuildContext context,
    WifiSpeedViewModel viewModel,
  ) async {
    final action = await viewModel.checkAndPrepareSpeedTest();
    if (!context.mounted) return;
    if (action == SpeedTestAction.showWifiDialog) {
      final primaryWifiName = await NativeApi().getPrimaryWifi();
      if (!context.mounted) return;
      final result = await ConnectWifiConfirmDialog.show(
        context,
        wifiName: primaryWifiName,
      );
      if (result == true) {
        if (!context.mounted) return;
        await viewModel.openWifiSettings();
      }
      return;
    }
    viewModel.startSpeedTest();
  }
}
