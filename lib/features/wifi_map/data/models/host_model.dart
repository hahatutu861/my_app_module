import 'package:freezed_annotation/freezed_annotation.dart';

part 'host_model.freezed.dart';

part 'host_model.g.dart';

@freezed
class HostModel with _$HostModel {
  const factory HostModel({
    required String id,
    required String mac,
    required String name,
    required String displayName,
    required String defaultName,
    required String deviceType,
    required String deviceTypeName,
    required String connectedWith,
    String? parentNode,
    String? parentNodeHwModel,
    required int deviceTypeDrawable,
    required int linkTypeDrawable,
    required int activePauseScheduleCount,
    required String defaultDeviceType,
    required String ipv4,
    String? ipv6,
    required bool active,
    required String activeLastTime,
    required bool isBlocked,
    required bool isThis,
    required bool isPrivateMode,
    required String linkTo,
    required String linkType,
    required String linkSpeed,
    required String linkWifiStandard,
    required String linkSsidId,
    required String linkRssi,
    required String linkSsidBand,
    required int linkSsidChannel,
    required String ssidName,
    String? extenderName,
    required String endTime,
    required String startTime,
    required String lastTime,
    required bool allowAccess,
    required bool permPaused,
    required bool tempResumed,
    String? tempStateEffectiveTime,
    required bool tempPaused,
    required bool pauseScheduledActive,
    required bool pauseScheduledInactive,
    required bool tempAllowedInSchedule,
    @Default([]) List<dynamic> denyAccessSchedules,
    dynamic tempAccessControl,
  }) = _HostModel;

  factory HostModel.fromJson(Map<String, dynamic> json) => _$HostModelFromJson(json);
}

@freezed
class GetHostsResponse with _$GetHostsResponse {
  const factory GetHostsResponse({
    required int httpCode,
    String? errCode,
    String? errMsg,
    required List<HostModel> hosts,
    required String systemTime,
  }) = _GetHostsResponse;

  factory GetHostsResponse.fromJson(Map<String, dynamic> json) => _$GetHostsResponseFromJson(json);
}
