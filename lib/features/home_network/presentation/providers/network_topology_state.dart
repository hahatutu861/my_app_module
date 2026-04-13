import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_topology_state.freezed.dart';

/// 网络拓扑动画状态
/// 用于控制动画序列播放：连线动画 → WiFi 成功动画 → 第二条连线动画 → 显示图标
@freezed
class NetworkTopologyState with _$NetworkTopologyState {
  /// 正在播放连线动画（add_line1.json）
  const factory NetworkTopologyState.showingLineAnimation() = _ShowingLineAnimation;

  /// 正在播放 WiFi 成功动画（add_wifi_success.json）
  const factory NetworkTopologyState.showingWifiSuccessAnimation() = _ShowingWifiSuccessAnimation;

  /// 正在播放第二条连线动画（add_line1.json）
  const factory NetworkTopologyState.showingSecondLineAnimation() = _ShowingSecondLineAnimation;

  /// 动画序列已完成，显示最终状态（wifi.png）
  const factory NetworkTopologyState.completed() = _Completed;
}
