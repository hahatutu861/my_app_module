import 'package:freezed_annotation/freezed_annotation.dart';

part 'host_model.freezed.dart';

part 'host_model.g.dart';

@freezed
class HostModel with _$HostModel {
  const factory HostModel({
    required String id,
    required String mac,
    required String name,
    String? defaultName,
    String? deviceType,
    String? defaultDeviceType,
    String? ipv4,
    String? ipv6,
    bool? active,
    String? activeLastTime,
    bool? isBlocked,
    String? linkTo,
    String? linkType,
    String? linkSpeed,
    String? linkWifiStandard,
    String? linkSsidId,
    String? linkRssi,
    bool? allowAccess,
    @Default([]) List<dynamic> denyAccessSchedules,
    dynamic tempAccessControl,
  }) = _HostModel;

  factory HostModel.fromJson(Map<String, dynamic> json) => _$HostModelFromJson(json);
}

@freezed
class GetHostsResponse with _$GetHostsResponse {
  const factory GetHostsResponse({
    required List<HostModel> hosts,
  }) = _GetHostsResponse;

  factory GetHostsResponse.fromJson(Map<String, dynamic> json) => _$GetHostsResponseFromJson(json);
}
