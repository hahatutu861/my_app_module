import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final nativeApi = NativeApi();
    _loadThemeMode(nativeApi);
    return ThemeMode.system;
  }

  Future<void> _loadThemeMode(NativeApi nativeApi) async {
    try {
      final modeEnum = await nativeApi.getThemeMode();
      state = _convertToThemeMode(modeEnum);
    } catch (e) {
      state = ThemeMode.system;
      debugPrint('加载主题模式失败: $e，使用系统主题');
    }
  }

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

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);
