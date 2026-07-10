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

/// 当前连接 WiFi 的链路信息（频段 / 信道 / 信号强度）
/// 仅承载原生采集的原始值，展示格式（如 "5GHz (Ch 6, -42 dBm)"）由 Flutter 端拼接
class WifiConnectionInfo {
  /// 频段 (2.4G, 5G, 6G)，来自 WifiUtils.checkCurrentWifiBand()，获取失败为 null
  String? band;
  /// 信道，来自 WifiUtils.getChannelByFrequency(frequency)，获取失败为 null
  int? channel;
  /// 信号强度 (dBm)，来自 wifiInfo.getRssi()，获取失败为 null
  int? rssi;

  WifiConnectionInfo({
    this.band,
    this.channel,
    this.rssi,
  });
}

/// 应用运行时配置（启动时从原生一次性获取）
class AppRuntimeConfig {
  /// 主题模式
  ThemeModeEnum themeMode;
  /// 设备ID
  String deviceId;
  /// 访问令牌
  String accessToken;
  /// 当前连接设备的名称，未连接时为 null
  String? connectedDeviceName;

  AppRuntimeConfig({
    required this.themeMode,
    required this.deviceId,
    required this.accessToken,
    this.connectedDeviceName,
  });
}

/// 原生平台 API
/// 由原生端实现，Flutter 端调用
@HostApi()
abstract class NativeApi {
  /// 获取应用运行时配置（主题模式、设备ID、访问令牌、连接设备名称）
  AppRuntimeConfig getAppRuntimeConfig();

  /// 关闭 Flutter Activity
  void closeFlutterActivity();

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

  /// 获取主 WiFi (Primary WiFi) 名称
  /// 优先返回 5G 主 WiFi 的 SSID，如果没有 5G 则返回第一个主 WiFi 的 SSID
  /// 返回 null 表示获取失败
  String? getPrimaryWifi();

  /// 打开手机 WiFi 设置页面
  void openWifiSettings();

  /// 获取当前连接 WiFi 的链路信息（频段、信道、信号强度）
  /// 返回 null 表示未连接 WiFi 或获取失败
  WifiConnectionInfo? getCurrentWifiConnectionInfo();
}

/// Flutter 回调 API
/// 由 Flutter 端实现，原生端调用
@FlutterApi()
abstract class NativeFlutterApi {
  /// WiFi 速度更新回调
  void onWifiSpeedUpdated(WifiSpeedResult result);
}
