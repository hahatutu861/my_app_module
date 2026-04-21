class ApiEndpoints {
  ApiEndpoints._();

  static const String deviceService = '/app-service/device/v1';

  static String devicesHosts(String deviceId) =>
      '/app-service/device/v1/devices/$deviceId/hosts';
}
