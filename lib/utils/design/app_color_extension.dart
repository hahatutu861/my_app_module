import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 主题颜色扩展
///
/// 自动根据当前主题亮度（light/dark）返回对应的颜色值
/// 使用方式：`Theme.of(context).appColors.brand6Normal`
extension AppColorsThemeExtension on ThemeData {
  AppThemeColors get appColors => AppThemeColors(this);
}

/// BuildContext 扩展，快捷访问主题颜色
///
/// 使用方式：`context.appColors.brand6Normal`
extension AppColorsContextExtension on BuildContext {
  AppThemeColors get appColors => Theme.of(this).appColors;
}

/// 主题颜色数据类
///
/// 包含所有应用颜色，自动适配 light/dark 模式
class AppThemeColors {
  final ThemeData theme;

  AppThemeColors(this.theme);

  bool get isDark => theme.brightness == Brightness.dark;

  /// 根据主题模式获取颜色
  ///
  /// [lightColor] 亮色模式下的颜色值
  /// [darkColor] 暗色模式下的颜色值（可选，默认使用亮色值）
  Color _c(int lightColor, [int? darkColor]) {
    return Color(isDark && darkColor != null ? darkColor : lightColor);
  }

  // ============== 品牌色 (Brand) ==============
  Color get brand1Light => _c(AppColors.brand1Light, AppColorsDark.brand1Light);
  Color get brand1LightNight =>
      _c(AppColors.brand1LightNight, AppColorsDark.brand1LightNight);
  Color get brand2Focus => _c(AppColors.brand2Focus, AppColorsDark.brand2Focus);
  Color get deviceCardGradientEnd =>
      _c(AppColors.deviceCardGradientEnd, AppColorsDark.deviceCardGradientEnd);
  Color get brand3Disabled =>
      _c(AppColors.brand3Disabled, AppColorsDark.brand3Disabled);
  Color get brand6Normal =>
      _c(AppColors.brand6Normal, AppColorsDark.brand6Normal);
  Color get brand8 => _c(AppColors.brand8, AppColorsDark.brand8);
  Color get brand8with20Opacity =>
      _c(AppColors.brand8with20Opacity, AppColorsDark.brand8with20Opacity);

  // ============== 青色系 (Cyan) ==============
  Color get cyan6 => _c(AppColors.cyan6, AppColorsDark.cyan6);
  Color get cyan => _c(AppColors.cyan, AppColorsDark.cyan);

  // ============== 浅蓝色系 (Light Blue) ==============
  Color get lightBlue4 => _c(AppColors.lightBlue4, AppColorsDark.lightBlue4);
  Color get lightBlue5 => _c(AppColors.lightBlue5, AppColorsDark.lightBlue5);
  Color get lightBlue6 => _c(AppColors.lightBlue6, AppColorsDark.lightBlue6);
  Color get lightBlue2 => _c(AppColors.lightBlue2, AppColorsDark.lightBlue2);
  Color get lightBlue3 => _c(AppColors.lightBlue3, AppColorsDark.lightBlue3);

  // ============== 紫色系 (Purple & Violet) ==============
  Color get purple6 => _c(AppColors.purple6, AppColorsDark.purple6);
  Color get violet1 => _c(AppColors.violet1, AppColorsDark.violet1);
  Color get violet2 => _c(AppColors.violet2, AppColorsDark.violet2);
  Color get violet3 => _c(AppColors.violet3, AppColorsDark.violet3);
  Color get violet6 => _c(AppColors.violet6, AppColorsDark.violet6);
  Color get indigo1 => _c(AppColors.indigo1, AppColorsDark.indigo1);
  Color get indigo6 => _c(AppColors.indigo6, AppColorsDark.indigo6);

  // ============== 绿色系 (Green & Success) ==============
  Color get success3Disabled =>
      _c(AppColors.success3Disabled, AppColorsDark.success3Disabled);
  Color get success6Normal =>
      _c(AppColors.success6Normal, AppColorsDark.success6Normal);
  Color get lightGreen5 => _c(AppColors.lightGreen5, AppColorsDark.lightGreen5);
  Color get lime1 => _c(AppColors.lime1, AppColorsDark.lime1);
  Color get lime6 => _c(AppColors.lime6, AppColorsDark.lime6);
  Color get green => _c(AppColors.green, AppColorsDark.green);
  Color get teal6 => _c(AppColors.teal6, AppColorsDark.teal6);

  // ============== 黄橙色系 (Yellow & Warning) ==============
  Color get warning1Light =>
      _c(AppColors.warning1Light, AppColorsDark.warning1Light);
  Color get warning2Focus =>
      _c(AppColors.warning2Focus, AppColorsDark.warning2Focus);
  Color get warning4 => _c(AppColors.warning4, AppColorsDark.warning4);
  Color get warning6Normal =>
      _c(AppColors.warning6Normal, AppColorsDark.warning6Normal);
  Color get yellow1 => _c(AppColors.yellow1, AppColorsDark.yellow1);
  Color get yellow6 => _c(AppColors.yellow6, AppColorsDark.yellow6);

  // ============== 红色系 (Error) ==============
  Color get error1Light => _c(AppColors.error1Light, AppColorsDark.error1Light);
  Color get error6Normal =>
      _c(AppColors.error6Normal, AppColorsDark.error6Normal);

  // ============== 灰色系 (Gray) ==============
  Color get gray1 => _c(AppColors.gray1, AppColorsDark.gray1);
  Color get gray1Night => _c(AppColors.gray1Night, AppColorsDark.gray1Night);
  Color get gray2 => _c(AppColors.gray2, AppColorsDark.gray2);
  Color get gray3 => _c(AppColors.gray3, AppColorsDark.gray3);
  Color get gray4 => _c(AppColors.gray4, AppColorsDark.gray4);
  Color get gray5 => _c(AppColors.gray5, AppColorsDark.gray5);
  Color get gray6 => _c(AppColors.gray6, AppColorsDark.gray6);
  Color get gray7 => _c(AppColors.gray7, AppColorsDark.gray7);
  Color get gray14 => _c(AppColors.gray14, AppColorsDark.gray14);
  Color get gray14Night => _c(AppColors.gray14Night, AppColorsDark.gray14Night);
  Color get gray14with20Opacity =>
      _c(AppColors.gray14with20Opacity, AppColorsDark.gray14with20Opacity);

  // ============== 基础色 ==============
  Color get white => _c(AppColors.white, AppColorsDark.white);
  Color get black => _c(AppColors.black, AppColorsDark.black);

  // ============== 文字颜色 (Font Colors) ==============
  Color get fontGy => _c(AppColors.fontGy, AppColorsDark.fontGy);
  Color get fontGy0 => _c(AppColors.fontGy0, AppColorsDark.fontGy0);
  Color get fontGy1with90Opacity =>
      _c(AppColors.fontGy1with90Opacity, AppColorsDark.fontGy1with90Opacity);
  Color get fontGy2with60Opacity =>
      _c(AppColors.fontGy2with60Opacity, AppColorsDark.fontGy2with60Opacity);
  Color get fontGy3with40Opacity =>
      _c(AppColors.fontGy3with40Opacity, AppColorsDark.fontGy3with40Opacity);
  Color get fontGy4with26Opacity =>
      _c(AppColors.fontGy4with26Opacity, AppColorsDark.fontGy4with26Opacity);
  Color get fontWh1with100Opacity =>
      _c(AppColors.fontWh1with100Opacity, AppColorsDark.fontWh1with100Opacity);
  Color get fontWh2with55Opacity =>
      _c(AppColors.fontWh2with55Opacity, AppColorsDark.fontWh2with55Opacity);
  Color get fontWh1with0Opacity =>
      _c(AppColors.fontWh1with0Opacity, AppColorsDark.fontWh1with0Opacity);

  // ============== 特殊用途颜色 ==============
  Color get popupTextBg => _c(AppColors.popupTextBg, AppColorsDark.popupTextBg);
  Color get buttonText => _c(AppColors.buttonText, AppColorsDark.buttonText);
  Color get privateModePopupBg =>
      _c(AppColors.privateModePopupBg, AppColorsDark.privateModePopupBg);
  Color get buttonTextDisable =>
      _c(AppColors.buttonTextDisable, AppColorsDark.buttonTextDisable);
  Color get refreshBg => _c(AppColors.refreshBg, AppColorsDark.refreshBg);
  Color get scanQrCodeBg =>
      _c(AppColors.scanQrCodeBg, AppColorsDark.scanQrCodeBg);
  Color get scanQrCodeTextDescription => _c(
    AppColors.scanQrCodeTextDescription,
    AppColorsDark.scanQrCodeTextDescription,
  );
  Color get scanQrCodeGraphicBg =>
      _c(AppColors.scanQrCodeGraphicBg, AppColorsDark.scanQrCodeGraphicBg);

  // ============== 常用快捷方式 ==============
  /// 获取主要文字颜色
  Color get primaryText => fontGy1with90Opacity;

  /// 获取次要文字颜色
  Color get secondaryText => fontGy2with60Opacity;

  /// 获取背景颜色
  Color get background => gray1;

  /// 获取卡片背景颜色
  Color get cardBackground => white;

  /// 获取边框颜色
  Color get border => gray3;
}
