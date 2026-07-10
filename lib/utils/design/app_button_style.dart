import 'package:flutter/material.dart';

/// 对话框按钮样式工具类
class AppDialogButtonStyle {
  AppDialogButtonStyle._();

  /// 创建对话框底部按钮样式
  ///
  /// [context] BuildContext，用于获取主题颜色
  /// [padding] 内边距，默认为 `EdgeInsets.symmetric(vertical: 16)`
  static ButtonStyle create(
    BuildContext context, {
    EdgeInsetsGeometry? padding,
  }) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        padding ?? const EdgeInsets.symmetric(vertical: 16),
      ),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      elevation: WidgetStateProperty.all(0),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
    );
  }
}
