import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color_extension.dart';

/// 主题文本样式扩展
///
/// 使用方式：`Theme.of(context).appTextStyles.bodyLargeWith90Opacity`
extension AppTextStylesThemeExtension on ThemeData {
  AppThemeTextStyles get appTextStyles => AppThemeTextStyles(this);
}

/// BuildContext 扩展，快捷访问文本样式
///
/// 使用方式：`context.appTextStyles.bodyLargeWith90Opacity`
extension AppTextStylesContextExtension on BuildContext {
  AppThemeTextStyles get appTextStyles => Theme.of(this).appTextStyles;
}

/// 主题文本样式数据类
///
/// 包含所有应用常用文本样式，自动适配 light/dark 模式
/// 基于项目中的实际使用情况提取
class AppThemeTextStyles {
  final ThemeData theme;

  AppThemeTextStyles(this.theme);

  /// 获取主题颜色
  AppThemeColors get _colors => theme.appColors;

  // ============== 常用文本样式 ==============

  /// 正文大号 + 90% 不透明度灰色
  ///
  /// 用于：正文文本、说明文字、节点名称等
  /// fontSize: 16, fontWeight: w400, color: fontGy1with90Opacity
  TextStyle get bodyLargeWith90Opacity => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: _colors.fontGy1with90Opacity,
      );

  /// 正文中号 + 90% 不透明度灰色
  ///
  /// 用于：次要说明文字
  /// fontSize: 14, fontWeight: w400, color: fontGy1with90Opacity
  TextStyle get bodyMediumWith90Opacity => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: _colors.fontGy1with90Opacity,
      );

  /// 正文中号 + 60% 不透明度灰色
  ///
  /// 用于：次要说明文字、更新时间
  /// fontSize: 14, fontWeight: w400, color: fontGy2with60Opacity
  TextStyle get bodyMediumWith60Opacity => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: _colors.fontGy2with60Opacity,
      );

  /// 标题 + 90% 不透明度灰色
  ///
  /// 用于：页面标题
  /// fontSize: 20, fontWeight: w500, color: fontGy1with90Opacity
  TextStyle get titleWith90Opacity => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: _colors.fontGy1with90Opacity,
      );

  /// 副标题 + 60% 不透明度灰色
  ///
  /// 用于：提示文字、说明文字
  /// fontSize: 14, fontWeight: w400, color: fontGy2with60Opacity
  TextStyle get subtitleWith60Opacity => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: _colors.fontGy2with60Opacity,
      );

  /// 标签 + 90% 不透明度灰色
  ///
  /// 用于：表单标签、列表项标题
  /// fontSize: 16, fontWeight: w500, color: fontGy1with90Opacity
  TextStyle get labelWith90Opacity => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: _colors.fontGy1with90Opacity,
      );

  /// 辅助文字 + 90% 不透明度灰色
  ///
  /// 用于：房间类型名称、列表项
  /// fontSize: 11, color: fontGy1with90Opacity
  TextStyle get captionWith90Opacity => TextStyle(
        fontSize: 11.sp,
        color: _colors.fontGy1with90Opacity,
      );

  /// 辅助文字 + 60% 不透明度灰色
  ///
  /// 用于：次要说明文字、标签
  /// fontSize: 12, fontWeight: w400, color: fontGy2with60Opacity
  TextStyle get captionWith60Opacity => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: _colors.fontGy2with60Opacity,
      );

  /// 正文 + 90% 不透明度灰色
  ///
  /// 用于：正文文字
  /// fontSize: 14, color: fontGy1with90Opacity
  TextStyle get bodyWith90Opacity => TextStyle(
        fontSize: 14.sp,
        color: _colors.fontGy1with90Opacity,
      );

  /// 按钮文字 + 白色
  ///
  /// 用于：主按钮文字
  /// fontSize: 16, fontWeight: w500, color: white
  TextStyle get buttonPrimary => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
}
