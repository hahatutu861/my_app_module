import 'package:flutter/material.dart';

/// BuildContext 扩展 - 媒体查询快捷访问
///
/// 使用方式：`context.screenWidth`, `context.screenHeight`
extension MediaQueryContextExtension on BuildContext {
  /// 屏幕宽度
  double get screenWidth => MediaQuery.of(this).size.width;

  /// 屏幕高度
  double get screenHeight => MediaQuery.of(this).size.height;

  /// 状态栏高度
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// 底部安全区域高度（如 Home 指示条）
  double get bottomSafeHeight => MediaQuery.of(this).padding.bottom;

  /// 导航栏高度（AppBar）
  double get appBarHeight => kToolbarHeight;

  /// 最小边距（通常为 8pt）
  double get minPadding => 8.0;

  /// 标准边距（通常为 16pt）
  double get standardPadding => 16.0;

  /// 大边距（通常为 24pt）
  double get largePadding => 24.0;

  /// 对话框宽度（屏幕宽度的 85%）
  double get dialogWidth => screenWidth * 0.85;
}
