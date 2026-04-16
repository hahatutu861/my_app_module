import 'package:flutter/material.dart';
import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/core/design/app_spacing_extension.dart';
import 'package:my_app_module/core/design/app_text_styles.dart';
import 'package:my_app_module/shared/ui/widgets/app_image.dart';

import '../../../../core/design/app_spacing.dart';
import '../../../../features/home_network/presentation/widgets/edit_button.dart';
import '../../../../shared/utils/build_context_extension.dart';

/// Wi-Fi 地图页面
/// 显示楼层的 Wi-Fi 设备网格，支持缩放和滑动
class WifiMapPage extends StatelessWidget {
  const WifiMapPage({super.key});

  // 🔴 只需要配置列数 + 间距，其他全部自动计算
  static const int crossAxisCount = 10;    // 固定10列
  static const double spacing = 8;        // 间距

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),
          _buildBackButton(context),
          _buildFloorTitle(context),

          // 🔥 核心：自适应宽高的网格区域（严丝合缝）
          _buildAutoSizeGrid(context),

          // 统计信息
          _buildStats(context),
        ],
      ),
    );
  }

  /// 🔥 自动计算宽高的网格（你要的核心逻辑在这里）
  Widget _buildAutoSizeGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1. 获取屏幕可用宽度
        final double totalWidth = constraints.maxWidth;

        // 2. 计算所有间距占用的宽度
        final double totalSpacingWidth = (crossAxisCount - 1) * spacing;

        // 3. 剩余宽度平均分给10个子项 = 正方形的边长（宽=高）
        final double squareSize = (totalWidth - totalSpacingWidth) / crossAxisCount;

        // 4. 计算总行数 110个 / 10列 = 11行
        const int totalItemCount = 110;
        final int rowCount = (totalItemCount / crossAxisCount).ceil();

        // 5. 计算网格总高度（正方形高度 × 行数 + 行间距）
        final double totalGridHeight =
            rowCount * squareSize + (rowCount - 1) * spacing;

        // 6. 用计算好的 总高度 包裹 InteractiveViewer
        return Container(
          color: Colors.red,
          width: double.infinity,
          height: totalGridHeight, // 🔥 高度完全匹配网格，无空白
          child: InteractiveViewer(
            alignment: Alignment.topLeft, // 强制左上角对齐，消除空白
            minScale: 0.5,
            maxScale: 3.0,
            boundaryMargin: EdgeInsets.zero,
            child: _buildGrid(context, squareSize),
          ),
        );
      },
    );
  }

  /// 网格内容（正方形子项）
  Widget _buildGrid(BuildContext context, double squareSize) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1, // 🔥 强制正方形
      ),
      itemCount: 110,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: context.appColors.gray1,
            borderRadius: BorderRadius.circular(12),
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
            'First floor',
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
    return Container(
      height: 43,
      padding: const EdgeInsets.only(left: AppSpacing.pad16),
      alignment: Alignment.centerLeft,
      child: Text(
        '0 zones',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: context.appColors.fontGy1with90Opacity,
        ),
      ),
    );
  }
}