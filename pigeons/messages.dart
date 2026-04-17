import 'package:pigeon/pigeon.dart';

/// 主题模式枚举
enum ThemeModeEnum {
  light,
  dark,
  system,
}

/// Android 原生 API
/// 由 Android 端实现，Flutter 端调用
@HostApi()
abstract class AndroidNativeApi {
  /// 获取当前主题模式
  ThemeModeEnum getThemeMode();

  /// 关闭 Flutter Activity
  void closeFlutterActivity();

  /// 获取访问令牌
  String getAccessToken();
}

/// Flutter 回调 API
/// 由 Flutter 端实现，Android 端调用
@FlutterApi()
abstract class AndroidFlutterApi {
  // 预留：主题变更回调
  // void onThemeModeChanged(ThemeModeEnum mode);

  // 在这里添加其他回调方法
  // 示例：
  // void onDataReceived(String data);
  // void onError(String message);
}
