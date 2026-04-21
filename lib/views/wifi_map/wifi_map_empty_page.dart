import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_spacing_extension.dart';
import 'package:my_app_module/utils/design/app_text_styles.dart';
import 'package:my_app_module/widgets/app_image.dart';

import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/utils/build_context_extension.dart';

/// Wi-Fi 地图空状态页面
///
/// 显示"暂无楼层"的提示，引导用户添加楼层
class WifiMapEmptyPage extends StatelessWidget {
  const WifiMapEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    
    debugPrint('=== WifiMapEmptyPage MediaQuery ===');
    debugPrint('statusBarHeight: $statusBarHeight');

    return Scaffold(
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 状态栏占位
          SizedBox(height: statusBarHeight),

          // NavBar 导航栏 (88px)
          Container(
            height: kToolbarHeight,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad16),
            child: Row(
              children: [
                // 左侧：返回图标 + "Back"
                // 使用 Expanded 让点击区域最大化
                Expanded(child: _buildBackButton(context)),

                // 右侧："Add floor" 按钮
                // 使用 Expanded 让点击区域最大化
                Expanded(child: _buildAddFloorButton(context)),
              ],
            ),
          ),

          // 页面标题 "Wi-Fi Map"（单独一行）
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.pad16,
            ),
            child: _PageTitle(),
          ),

          // 主内容区域（居中空状态）
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.pad16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 主提示文字
                    const _EmptyStateTitle(),

                    Spacing.v12,

                    // 辅助说明文字
                    const _EmptyStateDescription(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 返回图标
class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    return AppImage(
      'chevron_left.png',
      width: AppSpacing.icon24,
      height: AppSpacing.icon24,
      color: context.appColors.fontGy1with90Opacity,
    );
  }
}

/// "Back" 文字
class _BackText extends StatelessWidget {
  const _BackText();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.back,
      style: context.appTextStyles.bodyLargeWith90Opacity,
    );
  }
}

/// 构建返回按钮
///
/// 使用 Expanded 包裹，点击区域为左侧半屏，最大化可点击范围
Widget _buildBackButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.of(context).pop(),
    behavior: HitTestBehavior.opaque,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_BackIcon(), Spacing.h8, _BackText()],
      ),
    ),
  );
}

/// 构建 "Add floor" 按钮
///
/// 使用 Expanded 包裹，点击区域为右侧半屏，最大化可点击范围
Widget _buildAddFloorButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.push('/wifi-map');
    },
    behavior: HitTestBehavior.opaque,
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        context.l10n.addFloor,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: context.appColors.brand6Normal,
        ),
      ),
    ),
  );
}

/// 页面标题 "Wi-Fi Map"
class _PageTitle extends StatelessWidget {
  const _PageTitle();

  @override
  Widget build(BuildContext context) {
    // TODO: 添加翻译 context.l10n.wifiMap
    return Text(
      context.l10n.wifiMap,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: context.appColors.fontGy1with90Opacity,
      ),
    );
  }
}

/// 空状态主标题
class _EmptyStateTitle extends StatelessWidget {
  const _EmptyStateTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.noFloorsCreated,
      style: context.appTextStyles.bodyLargeWith90Opacity,
      textAlign: TextAlign.center,
    );
  }
}

/// 空状态辅助说明
class _EmptyStateDescription extends StatelessWidget {
  const _EmptyStateDescription();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.addFloorHint,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: context.appColors.fontGy2with60Opacity,
      ),
      textAlign: TextAlign.center,
    );
  }
}
