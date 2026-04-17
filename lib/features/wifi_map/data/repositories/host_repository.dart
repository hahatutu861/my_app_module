import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/core/errors/exceptions.dart';
import 'package:my_app_module/core/network/dio_client.dart';
import 'package:my_app_module/features/wifi_map/data/models/host_model.dart';

final hostRepositoryProvider = Provider<HostRepository>((ref) {
  return HostRepository(ref.watch(dioClientProvider));
});

class HostRepository {
  final Dio _dio;

  HostRepository(this._dio);

  Future<GetHostsResponse> getHosts(String deviceId) async {
    try {
      final response = await _dio.get(
        '/app-service/device/v1/devices/$deviceId/hosts',
      );

      if (response.statusCode == 200) {
        return GetHostsResponse.fromJson(response.data);
      } else {
        throw ServerException(
          message: '请求失败',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const UnauthorizedException(message: 'Token无效或已过期');
      } else if (e.response?.statusCode == 404) {
        throw const NotFoundException(message: '设备不存在');
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkException(message: '连接超时');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException(message: '网络连接失败');
      } else {
        throw ServerException(
          message: e.message ?? '服务器错误',
          statusCode: e.response?.statusCode,
        );
      }
    }
  }
}
