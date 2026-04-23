import 'package:pigeon/pigeon.dart';

/// 主题模式枚举
enum ThemeModeEnum {
  light,
  dark,
  system,
}

/// 原生平台 API
/// 由原生端实现，Flutter 端调用
@HostApi()
abstract class NativeApi {
  /// 获取当前主题模式
  ThemeModeEnum getThemeMode();

  /// 关闭 Flutter Activity
  void closeFlutterActivity();

  /// 获取访问令牌
  String getAccessToken();

  /// 获取设备ID
  String getDeviceId();

  /// 获取代理地址 (格式: ip:端口，例如 "192.168.1.100:8888")
  /// 返回空字符串表示不使用代理
  String getProxyAddress();
}

/// Flutter 回调 API
/// 由 Flutter 端实现，原生端调用
@FlutterApi()
abstract class NativeFlutterApi {
  // 预留：主题变更回调
  // void onThemeModeChanged(ThemeModeEnum mode);

  // 在这里添加其他回调方法
  // 示例：
  // void onDataReceived(String data);
  // void onError(String message);
}
