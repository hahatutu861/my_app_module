// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostModelImpl _$$HostModelImplFromJson(Map<String, dynamic> json) =>
    _$HostModelImpl(
      id: json['id'] as String,
      mac: json['mac'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      defaultName: json['defaultName'] as String,
      deviceType: json['deviceType'] as String,
      deviceTypeName: json['deviceTypeName'] as String,
      connectedWith: json['connectedWith'] as String,
      parentNode: json['parentNode'] as String?,
      parentNodeHwModel: json['parentNodeHwModel'] as String?,
      deviceTypeDrawable: (json['deviceTypeDrawable'] as num).toInt(),
      linkTypeDrawable: (json['linkTypeDrawable'] as num).toInt(),
      activePauseScheduleCount: (json['activePauseScheduleCount'] as num)
          .toInt(),
      defaultDeviceType: json['defaultDeviceType'] as String,
      ipv4: json['ipv4'] as String,
      ipv6: json['ipv6'] as String?,
      active: json['active'] as bool,
      activeLastTime: json['activeLastTime'] as String,
      isBlocked: json['isBlocked'] as bool,
      isThis: json['isThis'] as bool,
      isPrivateMode: json['isPrivateMode'] as bool,
      linkTo: json['linkTo'] as String,
      linkType: json['linkType'] as String,
      linkSpeed: json['linkSpeed'] as String,
      linkWifiStandard: json['linkWifiStandard'] as String,
      linkSsidId: json['linkSsidId'] as String,
      linkRssi: json['linkRssi'] as String,
      linkSsidBand: json['linkSsidBand'] as String,
      linkSsidChannel: (json['linkSsidChannel'] as num).toInt(),
      ssidName: json['ssidName'] as String,
      extenderName: json['extenderName'] as String?,
      endTime: json['endTime'] as String,
      startTime: json['startTime'] as String,
      lastTime: json['lastTime'] as String,
      allowAccess: json['allowAccess'] as bool,
      permPaused: json['permPaused'] as bool,
      tempResumed: json['tempResumed'] as bool,
      tempStateEffectiveTime: json['tempStateEffectiveTime'] as String?,
      tempPaused: json['tempPaused'] as bool,
      pauseScheduledActive: json['pauseScheduledActive'] as bool,
      pauseScheduledInactive: json['pauseScheduledInactive'] as bool,
      tempAllowedInSchedule: json['tempAllowedInSchedule'] as bool,
      denyAccessSchedules:
          json['denyAccessSchedules'] as List<dynamic>? ?? const [],
      tempAccessControl: json['tempAccessControl'],
    );

Map<String, dynamic> _$$HostModelImplToJson(_$HostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mac': instance.mac,
      'name': instance.name,
      'displayName': instance.displayName,
      'defaultName': instance.defaultName,
      'deviceType': instance.deviceType,
      'deviceTypeName': instance.deviceTypeName,
      'connectedWith': instance.connectedWith,
      'parentNode': instance.parentNode,
      'parentNodeHwModel': instance.parentNodeHwModel,
      'deviceTypeDrawable': instance.deviceTypeDrawable,
      'linkTypeDrawable': instance.linkTypeDrawable,
      'activePauseScheduleCount': instance.activePauseScheduleCount,
      'defaultDeviceType': instance.defaultDeviceType,
      'ipv4': instance.ipv4,
      'ipv6': instance.ipv6,
      'active': instance.active,
      'activeLastTime': instance.activeLastTime,
      'isBlocked': instance.isBlocked,
      'isThis': instance.isThis,
      'isPrivateMode': instance.isPrivateMode,
      'linkTo': instance.linkTo,
      'linkType': instance.linkType,
      'linkSpeed': instance.linkSpeed,
      'linkWifiStandard': instance.linkWifiStandard,
      'linkSsidId': instance.linkSsidId,
      'linkRssi': instance.linkRssi,
      'linkSsidBand': instance.linkSsidBand,
      'linkSsidChannel': instance.linkSsidChannel,
      'ssidName': instance.ssidName,
      'extenderName': instance.extenderName,
      'endTime': instance.endTime,
      'startTime': instance.startTime,
      'lastTime': instance.lastTime,
      'allowAccess': instance.allowAccess,
      'permPaused': instance.permPaused,
      'tempResumed': instance.tempResumed,
      'tempStateEffectiveTime': instance.tempStateEffectiveTime,
      'tempPaused': instance.tempPaused,
      'pauseScheduledActive': instance.pauseScheduledActive,
      'pauseScheduledInactive': instance.pauseScheduledInactive,
      'tempAllowedInSchedule': instance.tempAllowedInSchedule,
      'denyAccessSchedules': instance.denyAccessSchedules,
      'tempAccessControl': instance.tempAccessControl,
    };

_$GetHostsResponseImpl _$$GetHostsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GetHostsResponseImpl(
  httpCode: (json['httpCode'] as num).toInt(),
  errCode: json['errCode'] as String?,
  errMsg: json['errMsg'] as String?,
  hosts: (json['hosts'] as List<dynamic>)
      .map((e) => HostModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  systemTime: json['systemTime'] as String,
);

Map<String, dynamic> _$$GetHostsResponseImplToJson(
  _$GetHostsResponseImpl instance,
) => <String, dynamic>{
  'httpCode': instance.httpCode,
  'errCode': instance.errCode,
  'errMsg': instance.errMsg,
  'hosts': instance.hosts,
  'systemTime': instance.systemTime,
};
