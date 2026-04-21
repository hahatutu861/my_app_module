import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';

/// 主题模式状态管理
///
/// 从原生端获取主题模式并管理状态
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final NativeApi _nativeApi;

  ThemeModeNotifier(this._nativeApi) : super(ThemeMode.system) {
    _loadThemeMode();
  }

  /// 从原生端加载主题模式
  Future<void> _loadThemeMode() async {
    try {
      final modeEnum = await _nativeApi.getThemeMode();
      state = _convertToThemeMode(modeEnum);
    } catch (e) {
      state = ThemeMode.system;
      debugPrint('加载主题模式失败: $e，使用系统主题');
    }
  }

  /// 将 Pigeon 枚举转换为 Flutter ThemeMode
  ThemeMode _convertToThemeMode(ThemeModeEnum modeEnum) {
    switch (modeEnum) {
      case ThemeModeEnum.light:
        return ThemeMode.light;
      case ThemeModeEnum.dark:
        return ThemeMode.dark;
      case ThemeModeEnum.system:
        return ThemeMode.system;
    }
  }
}

/// 主题模式 Provider
///
/// 使用示例：
/// ```dart
/// final themeMode = ref.watch(themeModeProvider);
/// MaterialApp(themeMode: themeMode, ...)
/// ```
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final nativeApi = NativeApi();
  return ThemeModeNotifier(nativeApi);
});
