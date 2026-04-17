import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/features/home_network/vm/network_topology_state.dart';

final networkTopologyViewModelProvider =
    StateNotifierProvider<NetworkTopologyViewModel, NetworkTopologyState>((ref) {
  return NetworkTopologyViewModel();
});

class NetworkTopologyViewModel extends StateNotifier<NetworkTopologyState> {
  NetworkTopologyViewModel() : super(const NetworkTopologyState.showingLineAnimation());

  void onLineAnimationCompleted() {
    state = const NetworkTopologyState.showingWifiSuccessAnimation();
  }

  void onWifiSuccessAnimationCompleted() {
    state = const NetworkTopologyState.showingSecondLineAnimation();
  }

  void onSecondLineAnimationCompleted() {
    state = const NetworkTopologyState.completed();
  }
}
