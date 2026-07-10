import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceIdProvider = Provider<String>((ref) {
  throw UnimplementedError('需要在 main.dart 中 overrideWithValue 注入');
});

final tokenProvider = Provider<String>((ref) {
  throw UnimplementedError('需要在 main.dart 中 overrideWithValue 注入');
});

final connectedDeviceNameProvider = Provider<String?>((ref) {
  throw UnimplementedError('需要在 main.dart 中 overrideWithValue 注入');
});

/// 应用语言代码（如 en、fr），不依赖系统语言，从原生 AppRuntimeConfig 获取
final languageProvider = Provider<String>((ref) {
  throw UnimplementedError('需要在 main.dart 中 overrideWithValue 注入');
});

/// 是否启用日志打印，从原生 AppRuntimeConfig 获取
final enableLogProvider = Provider<bool>((ref) {
  throw UnimplementedError('需要在 main.dart 中 overrideWithValue 注入');
});

/// API 环境标识（net 或 com），从原生 AppRuntimeConfig 获取
final environmentProvider = Provider<String>((ref) {
  throw UnimplementedError('需要在 main.dart 中 overrideWithValue 注入');
});
