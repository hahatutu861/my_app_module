import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/viewmodels/home_network/network_topology_state.dart';

final networkTopologyViewModelProvider =
    NotifierProvider<NetworkTopologyViewModel, NetworkTopologyState>(NetworkTopologyViewModel.new);

class NetworkTopologyViewModel extends Notifier<NetworkTopologyState> {
  @override
  NetworkTopologyState build() {
    return const NetworkTopologyState.showingLineAnimation();
  }

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
