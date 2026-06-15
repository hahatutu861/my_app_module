import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';

/// 当前连接 WiFi 的链路信息（频段 / 信道 / 信号强度）
/// 反映手机实时连接状态，随房间栏展示时拉取，隐藏后自动释放
final wifiConnectionInfoProvider =
    FutureProvider.autoDispose<WifiConnectionInfo?>((ref) async {
  return NativeApi().getCurrentWifiConnectionInfo();
});

/// 将原生原始值拼接为展示字符串，例如 "5GHz (Ch 6, -42 dBm)"
/// 单位与格式集中在此控制，原生侧只负责采集
String formatWifiConnectionInfo(WifiConnectionInfo? info) {
  if (info == null) return '--';
  final band = (info.band ?? '').replaceAll('G', 'GHz');
  final parts = <String>[];
  if (info.channel != null) parts.add('Ch ${info.channel}');
  if (info.rssi != null) parts.add('${info.rssi} dBm');
  if (band.isEmpty && parts.isEmpty) return '--';
  final detail = parts.isEmpty ? '' : ' (${parts.join(', ')})';
  return '$band$detail';
}
