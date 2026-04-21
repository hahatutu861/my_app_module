import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_topology_state.freezed.dart';

@freezed
class NetworkTopologyState with _$NetworkTopologyState {
  const factory NetworkTopologyState.showingLineAnimation() = _ShowingLineAnimation;
  const factory NetworkTopologyState.showingWifiSuccessAnimation() = _ShowingWifiSuccessAnimation;
  const factory NetworkTopologyState.showingSecondLineAnimation() = _ShowingSecondLineAnimation;
  const factory NetworkTopologyState.completed() = _Completed;
}
