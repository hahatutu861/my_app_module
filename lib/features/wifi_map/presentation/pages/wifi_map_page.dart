import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/core/design/app_spacing_extension.dart';
import 'package:my_app_module/core/design/app_text_styles.dart';
import 'package:my_app_module/shared/ui/widgets/app_image.dart';
import 'package:my_app_module/shared/providers/shared_preferences_provider.dart';

import '../../../../core/design/app_spacing.dart';
import '../../../../features/home_network/presentation/widgets/edit_button.dart';
import '../../../../shared/utils/build_context_extension.dart';
import '../widgets/wifi_map_dialog.dart';

/// Wi-Fi 地图页面
/// 显示楼层的 Wi-Fi 设备网格，支持缩放和滑动
class WifiMapPage extends HookConsumerWidget {
  const WifiMapPage({super.key});

  static const int crossAxisCount = 10;
  static const double spacing = 4;
  static const String _dialogShownKey = 'has_shown_wifi_map_dialog';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        _checkAndShowDialog(context, ref);
        return null;
      },
      [],
    );

    final transformationController = useMemoized(
      () {
        final controller = TransformationController();
        controller.value = Matrix4.identity()..scaleByDouble(1.5, 1.5, 1.0, 1.0);
        return controller;
      },
    );

    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _buildBackButton(context),
          _buildFloorTitle(context),
          SizedBox(height: 16),
          _buildAutoSizeGrid(context, transformationController),
          _buildStats(context),
        ],
      ),
    );
  }

  Widget _buildAutoSizeGrid(BuildContext context, TransformationController transformationController) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        const double minHorizontalPadding = 16;
        final double availableWidth = screenWidth - minHorizontalPadding * 2;
        final double totalSpacingWidth = (crossAxisCount - 1) * spacing;
        final double squareSize = (availableWidth - totalSpacingWidth) / crossAxisCount;
        const int totalItemCount = 110;
        final int rowCount = (totalItemCount / crossAxisCount).ceil();
        final double totalGridHeight =
            rowCount * squareSize + (rowCount - 1) * spacing;
        return SizedBox(
          width: double.infinity,
          height: totalGridHeight,
          child: InteractiveViewer(
            alignment: Alignment.topLeft,
            minScale: 1.0,
            maxScale: 2.0,
            boundaryMargin: EdgeInsets.zero,
            transformationController: transformationController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: minHorizontalPadding),
              child: _buildGrid(context, squareSize),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context, double squareSize) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1,
      ),
      itemCount: 110,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: context.appColors.gray1,
            borderRadius: BorderRadius.circular(6),
          ),
        );
      },
    );
  }

  Widget _buildFloorTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Text(
            context.l10n.firstFloor,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: context.appColors.fontGy1with90Opacity,
            ),
          ),
          Spacing.h2,
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              'chevron_left.png',
              width: AppSpacing.icon24,
              height: AppSpacing.icon24,
              color: context.appColors.fontGy1with90Opacity,
            ),
            Spacing.h8,
            Text(
              context.l10n.back,
              style: context.appTextStyles.bodyLargeWith90Opacity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return EditButton(onTap: () {
      debugPrint('Edit button tapped');
    });
  }

  Widget _buildStats(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.pad16, left: AppSpacing.pad16),
      child: Text(
        context.l10n.noZones,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }

  Future<void> _checkAndShowDialog(BuildContext context, WidgetRef ref) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final hasShown = prefs.getBool(_dialogShownKey) ?? false;
    if (!hasShown) {
      await prefs.setBool(_dialogShownKey, true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const WifiMapDialog(),
        );
      });
    }
  }
}
