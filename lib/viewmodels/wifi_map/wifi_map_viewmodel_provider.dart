import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/host_model.dart';
import 'package:my_app_module/repositories/host_repository.dart';
import 'package:my_app_module/viewmodels/wifi_map/wifi_map_state.dart';

final wifiMapViewModelProvider =
    StateNotifierProvider<WifiMapViewModel, WifiMapState>((ref) {
  return WifiMapViewModel(ref.read(hostRepositoryProvider));
});

class WifiMapViewModel extends StateNotifier<WifiMapState> {
  final HostRepository _repository;

  WifiMapViewModel(this._repository) : super(const WifiMapState.initial());

  Future<void> loadHosts() async {
    state = const WifiMapState.loading();
    try {
      final GetHostsResponse response = await _repository.getHosts();
      state = WifiMapState.loaded(hosts: response.hosts);
    } catch (e) {
      state = WifiMapState.error(message: e.toString());
    }
  }
}

extension WifiMapStateExtension on WifiMapState {
  int get hostsCount {
    return maybeWhen(
      loaded: (hosts) => hosts.length,
      orElse: () => 0,
    );
  }
}
