import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/host_model.dart';
import 'package:my_app_module/repositories/base_repository.dart';
import 'package:my_app_module/services/network/dio_client.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';

final hostRepositoryProvider = Provider<HostRepository>((ref) {
  return HostRepository(ref.watch(dioClientProvider));
});

class HostRepository extends BaseRepository {
  HostRepository(super._dio);

  Future<GetHostsResponse> getHosts() async {
    final deviceId = await NativeApi().getDeviceId();
    return get<GetHostsResponse>(
      '/app-service/device/v1/devices/$deviceId/hosts',
      parser: (data) => GetHostsResponse.fromJson(data),
    );
  }
}
