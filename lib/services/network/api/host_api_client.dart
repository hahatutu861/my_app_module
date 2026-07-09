import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:my_app_module/models/host_model.dart';

part 'host_api_client.g.dart';

@RestApi()
abstract class HostApiClient {
  factory HostApiClient(Dio dio, {String baseUrl}) = _HostApiClient;

  @GET("/app-service/device/v1/devices/{deviceId}/hosts")
  Future<GetHostsResponse> getHosts(@Path("deviceId") String deviceId);
}
