import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/host_model.dart';
import 'package:my_app_module/providers/device_id_provider.dart';
import 'package:my_app_module/services/network/dio_client.dart';
import 'package:my_app_module/services/network/api/host_api_client.dart';

final hostApiProvider = Provider<HostApiClient>((ref) {
  return HostApiClient(ref.watch(dioClientProvider));
});

final hostRepositoryProvider = Provider<HostRepository>((ref) {
  return HostRepository(ref.watch(hostApiProvider), ref);
});

class HostRepository {
  final HostApiClient _apiClient;
  final Ref _ref;

  HostRepository(this._apiClient, this._ref);

  Future<GetHostsResponse> getHosts() async {
    try {
      final deviceId = _ref.read(deviceIdProvider);
      return await _apiClient.getHosts(deviceId);
    } catch (e) {
      rethrow;
    }
  }
}
