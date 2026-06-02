import 'package:pigeon/pigeon.dart';

/// 主题模式枚举
enum ThemeModeEnum {
  light,
  dark,
  system,
}

/// WiFi 测速结果
class WifiSpeedResult {
  /// WiFi 速度 (Mbps), -1 表示失败
  double speed;
  /// 是否成功
  bool isSuccess;
  /// 错误信息
  String? errorMessage;

  WifiSpeedResult({
    required this.speed,
    required this.isSuccess,
    this.errorMessage,
  });
}

/// 主 WiFi (Primary WiFi) 信息
class PrimaryWifiInfo {
  /// WiFi 名称
  String name;
  /// WiFi 密码
  String password;
  /// 频段 (2.4G, 5G, 6G)
  String band;
  /// 是否为 5G WiFi
  bool is5G;

  PrimaryWifiInfo({
    required this.name,
    required this.password,
    required this.band,
    required this.is5G,
  });
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

  /// 开始 WiFi 实时测速
  /// 通过 NativeFlutterApi.onWifiSpeedUpdated 回调返回结果
  void startWifiSpeedTest();

  /// 停止 WiFi 测速
  void stopWifiSpeedTest();

  /// 判断当前连接的 WiFi 是否是当前设备（modem）的 WiFi
  /// 通过比较当前连接的 BSSID 与设备 WiFi 列表中的 BSSID
  /// 返回 true 表示当前连接到设备 WiFi，false 表示未连接或连接的是其他 WiFi
  bool isConnectedToDeviceWifi();

  /// 获取主 WiFi (Primary WiFi) 信息
  /// 优先返回 5G 主 WiFi，如果没有 5G 则返回第一个主 WiFi
  /// 返回 null 表示获取失败
  PrimaryWifiInfo? getPrimaryWifi();
}

/// Flutter 回调 API
/// 由 Flutter 端实现，原生端调用
@FlutterApi()
abstract class NativeFlutterApi {
  /// WiFi 速度更新回调
  void onWifiSpeedUpdated(WifiSpeedResult result);
}
