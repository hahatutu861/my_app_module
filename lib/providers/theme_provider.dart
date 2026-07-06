import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';

/// 将原生主题枚举转换为 Flutter 的 ThemeMode
ThemeMode convertToThemeMode(ThemeModeEnum modeEnum) {
  switch (modeEnum) {
    case ThemeModeEnum.light:
      return ThemeMode.light;
    case ThemeModeEnum.dark:
      return ThemeMode.dark;
    case ThemeModeEnum.system:
      return ThemeMode.system;
  }
}

class ThemeModeNotifier extends Notifier<ThemeMode> {
  final ThemeMode? initialMode;

  ThemeModeNotifier({this.initialMode});

  @override
  ThemeMode build() {
    if (initialMode != null) {
      return initialMode!;
    }
    final nativeApi = NativeApi();
    _loadThemeMode(nativeApi);
    return ThemeMode.system;
  }

  Future<void> _loadThemeMode(NativeApi nativeApi) async {
    try {
      final modeEnum = await nativeApi.getThemeMode();
      state = convertToThemeMode(modeEnum);
    } catch (e) {
      state = ThemeMode.system;
      debugPrint('加载主题模式失败: $e，使用系统主题');
    }
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(() => ThemeModeNotifier());
