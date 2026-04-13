import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'network_topology_state.dart';

/// 网络拓扑动画 ViewModel Provider
final networkTopologyViewModelProvider =
    StateNotifierProvider<NetworkTopologyViewModel, NetworkTopologyState>((ref) {
  return NetworkTopologyViewModel();
});

/// 网络拓扑动画 ViewModel
/// 管理 Lottie 动画序列的状态转换
class NetworkTopologyViewModel extends StateNotifier<NetworkTopologyState> {
  NetworkTopologyViewModel() : super(const NetworkTopologyState.showingLineAnimation());

  /// 连线动画（add_line1.json）播放完成
  /// 触发下一个动画：WiFi 成功动画
  void onLineAnimationCompleted() {
    state = const NetworkTopologyState.showingWifiSuccessAnimation();
  }

  /// WiFi 成功动画（add_wifi_success.json）播放完成
  /// 触发下一个动画：第二条连线动画
  void onWifiSuccessAnimationCompleted() {
    state = const NetworkTopologyState.showingSecondLineAnimation();
  }

  /// 第二条连线动画（add_line1.json）播放完成
  /// 动画序列结束，显示最终状态
  void onSecondLineAnimationCompleted() {
    state = const NetworkTopologyState.completed();
  }
}
