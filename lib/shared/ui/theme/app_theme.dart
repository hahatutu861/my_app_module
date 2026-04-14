/// 应用主题配置
///
/// 架构说明：
/// - 此类属于 Shared Layer，提供 Flutter 框架的主题集成
/// - 依赖 core/design 的纯颜色常量
/// - 将 int 颜色值转换为 Flutter 的 Color 对象
/// - 全局共享，不属于任何单一功能模块
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_spacing.dart';

/// 应用主题配置
class AppTheme {
  AppTheme._();

  /// 将 int 颜色值转换为 Color
  static Color _c(int colorValue) => Color(colorValue);

  /// 亮色主题
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Inter',

      // 颜色方案
      colorScheme: ColorScheme.light(
        primary: _c(AppColors.brand6Normal),
        onPrimary: _c(AppColors.white),
        primaryContainer: _c(AppColors.brand1Light),
        onPrimaryContainer: _c(AppColors.brand8),

        secondary: _c(AppColors.violet6),
        onSecondary: _c(AppColors.white),
        secondaryContainer: _c(AppColors.violet1),
        onSecondaryContainer: _c(AppColors.violet6),

        tertiary: _c(AppColors.teal6),
        onTertiary: _c(AppColors.white),

        error: _c(AppColors.error6Normal),
        onError: _c(AppColors.white),
        errorContainer: _c(AppColors.error1Light),

        outline: _c(AppColors.gray4),
        outlineVariant: _c(AppColors.gray2),

        surface: _c(AppColors.white),
        onSurface: _c(AppColors.fontGy),
        onSurfaceVariant: _c(AppColors.fontGy2with60Opacity),

        shadow: _c(AppColors.black),
        scrim: _c(AppColors.gray14with20Opacity),
      ),

      // AppBar 主题
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: _c(AppColors.white),
        foregroundColor: _c(AppColors.fontGy),
        iconTheme: IconThemeData(color: _c(AppColors.fontGy)),
        titleTextStyle: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        // 系统栏样式 - 亮色模式使用深色图标
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),

      // 卡片主题
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radius4)),
        color: _c(AppColors.white),
        surfaceTintColor: Colors.transparent,
      ),

      // 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _c(AppColors.brand6Normal),
          foregroundColor: _c(AppColors.white),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad24, vertical: AppSpacing.s12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radius4)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _c(AppColors.brand6Normal),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad16, vertical: AppSpacing.s8),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _c(AppColors.brand6Normal),
          side: BorderSide(color: _c(AppColors.brand6Normal)),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad24, vertical: AppSpacing.s12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radius4)),
        ),
      ),

      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _c(AppColors.gray1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius4),
          borderSide: BorderSide(color: _c(AppColors.gray4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius4),
          borderSide: BorderSide(color: _c(AppColors.gray4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius4),
          borderSide: BorderSide(color: _c(AppColors.brand6Normal), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius4),
          borderSide: BorderSide(color: _c(AppColors.error6Normal)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius4),
          borderSide: BorderSide(color: _c(AppColors.error6Normal), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pad16,
          vertical: AppSpacing.s12,
        ),
      ),

      // 分割线主题
      dividerTheme: DividerThemeData(
        color: _c(AppColors.gray3),
        thickness: 1,
        space: 1,
      ),

      // 图标主题
      iconTheme: IconThemeData(color: _c(AppColors.gray7), size: AppSpacing.icon24),

      // 文本主题
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: _c(AppColors.fontGy2with60Opacity),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: _c(AppColors.fontGy3with40Opacity),
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          color: _c(AppColors.fontGy),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Scaffold 背景色
      scaffoldBackgroundColor: _c(AppColors.gray1),

      // 对话框主题
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radius4)),
        backgroundColor: _c(AppColors.white),
      ),

      // 底部弹出层主题
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.s16)),
        ),
        backgroundColor: _c(AppColors.white),
      ),

      // SnackBar 主题
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radius4)),
        backgroundColor: _c(AppColors.gray14),
        contentTextStyle: TextStyle(color: _c(AppColors.fontWh1with100Opacity)),
      ),

      // Tab 主题
      tabBarTheme: TabBarThemeData(
        labelColor: _c(AppColors.brand6Normal),
        unselectedLabelColor: _c(AppColors.gray6),
        indicatorColor: _c(AppColors.brand6Normal),
        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),

      // Chip 主题
      chipTheme: ChipThemeData(
        backgroundColor: _c(AppColors.gray1),
        selectedColor: _c(AppColors.brand1Light),
        labelStyle: TextStyle(color: _c(AppColors.fontGy)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radius4)),
        side: BorderSide(color: _c(AppColors.gray4)),
      ),
    );
  }

  /// 暗色主题
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Inter',

      // 颜色方案
      colorScheme: ColorScheme.dark(
        primary: _c(AppColorsDark.brand6Normal),
        onPrimary: _c(AppColorsDark.white),
        primaryContainer: _c(AppColorsDark.brand1Light),
        onPrimaryContainer: _c(AppColorsDark.brand8),

        secondary: _c(AppColorsDark.violet6),
        onSecondary: _c(AppColorsDark.white),
        secondaryContainer: _c(AppColorsDark.violet2),
        onSecondaryContainer: _c(AppColorsDark.violet6),

        tertiary: _c(AppColorsDark.teal6),
        onTertiary: _c(AppColorsDark.white),

        error: _c(AppColorsDark.error6Normal),
        onError: _c(AppColorsDark.white),
        errorContainer: _c(AppColorsDark.error1Light),

        outline: _c(AppColorsDark.gray4),
        outlineVariant: _c(AppColorsDark.gray3),

        surface: _c(AppColorsDark.gray2),
        onSurface: _c(AppColorsDark.fontGy1with90Opacity),
        onSurfaceVariant: _c(AppColorsDark.fontGy2with60Opacity),

        shadow: _c(AppColorsDark.black),
        scrim: _c(AppColorsDark.gray14with20Opacity),
      ),

      // AppBar 主题
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: _c(AppColorsDark.gray2),
        foregroundColor: _c(AppColorsDark.fontGy1with90Opacity),
        iconTheme: IconThemeData(color: _c(AppColorsDark.fontGy1with90Opacity)),
        titleTextStyle: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        // 系统栏样式 - 暗色模式使用浅色图标
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xFF1C1C1E),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      // 卡片主题
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: _c(AppColorsDark.gray2),
        surfaceTintColor: Colors.transparent,
      ),

      // 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _c(AppColorsDark.brand6Normal),
          foregroundColor: _c(AppColorsDark.white),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _c(AppColorsDark.brand6Normal),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _c(AppColorsDark.brand6Normal),
          side: BorderSide(color: _c(AppColorsDark.brand6Normal)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _c(AppColorsDark.gray3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _c(AppColorsDark.gray4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _c(AppColorsDark.gray4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: _c(AppColorsDark.brand6Normal),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _c(AppColorsDark.error6Normal)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: _c(AppColorsDark.error6Normal),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),

      // 分割线主题
      dividerTheme: DividerThemeData(
        color: _c(AppColorsDark.gray3),
        thickness: 1,
        space: 1,
      ),

      // 图标主题
      iconTheme: IconThemeData(color: _c(AppColorsDark.gray7), size: 24),

      // 文本主题
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: _c(AppColorsDark.fontGy2with60Opacity),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: _c(AppColorsDark.fontGy4with26Opacity),
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Scaffold 背景色
      scaffoldBackgroundColor: _c(AppColorsDark.gray1),

      // 对话框主题
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: _c(AppColorsDark.gray2),
      ),

      // 底部弹出层主题
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: _c(AppColorsDark.gray2),
      ),

      // SnackBar 主题
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: _c(AppColorsDark.gray3),
        contentTextStyle: TextStyle(
          color: _c(AppColorsDark.fontGy1with90Opacity),
        ),
      ),

      // Tab 主题
      tabBarTheme: TabBarThemeData(
        labelColor: _c(AppColorsDark.brand6Normal),
        unselectedLabelColor: _c(AppColorsDark.fontGy2with60Opacity),
        indicatorColor: _c(AppColorsDark.brand6Normal),
        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),

      // Chip 主题
      chipTheme: ChipThemeData(
        backgroundColor: _c(AppColorsDark.gray3),
        selectedColor: _c(AppColorsDark.brand1Light),
        labelStyle: TextStyle(color: _c(AppColorsDark.fontGy1with90Opacity)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: _c(AppColorsDark.gray4)),
      ),
    );
  }
}
