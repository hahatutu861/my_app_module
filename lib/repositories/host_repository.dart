import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/config/api_endpoints.dart';
import 'package:my_app_module/models/host_model.dart';
import 'package:my_app_module/providers/device_id_provider.dart';
import 'package:my_app_module/repositories/base_repository.dart';
import 'package:my_app_module/services/network/dio_client.dart';

final hostRepositoryProvider = Provider<HostRepository>((ref) {
  return HostRepository(ref.watch(dioClientProvider), ref);
});

class HostRepository extends BaseRepository {
  final Ref _ref;

  HostRepository(super._dio, this._ref);

  Future<GetHostsResponse> getHosts() async {
    final deviceId = await _ref.read(deviceIdProvider.future);
    return get<GetHostsResponse>(
      ApiEndpoints.devicesHosts(deviceId),
      parser: (data) => GetHostsResponse.fromJson(data),
    );
  }
}
