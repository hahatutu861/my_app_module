import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_topology_state.freezed.dart';

@freezed
sealed class NetworkTopologyState with _$NetworkTopologyState {
  const factory NetworkTopologyState.showingLineAnimation() = NetworkTopologyStateShowingLineAnimation;
  const factory NetworkTopologyState.showingWifiSuccessAnimation() = NetworkTopologyStateShowingWifiSuccessAnimation;
  const factory NetworkTopologyState.showingSecondLineAnimation() = NetworkTopologyStateShowingSecondLineAnimation;
  const factory NetworkTopologyState.completed() = NetworkTopologyStateCompleted;
}
