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
      defaultName: json['defaultName'] as String?,
      deviceType: json['deviceType'] as String?,
      defaultDeviceType: json['defaultDeviceType'] as String?,
      ipv4: json['ipv4'] as String?,
      ipv6: json['ipv6'] as String?,
      active: json['active'] as bool?,
      activeLastTime: json['activeLastTime'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      linkTo: json['linkTo'] as String?,
      linkType: json['linkType'] as String?,
      linkSpeed: json['linkSpeed'] as String?,
      linkWifiStandard: json['linkWifiStandard'] as String?,
      linkSsidId: json['linkSsidId'] as String?,
      linkRssi: json['linkRssi'] as String?,
      allowAccess: json['allowAccess'] as bool?,
      denyAccessSchedules:
          json['denyAccessSchedules'] as List<dynamic>? ?? const [],
      tempAccessControl: json['tempAccessControl'],
    );

Map<String, dynamic> _$$HostModelImplToJson(_$HostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mac': instance.mac,
      'name': instance.name,
      'defaultName': instance.defaultName,
      'deviceType': instance.deviceType,
      'defaultDeviceType': instance.defaultDeviceType,
      'ipv4': instance.ipv4,
      'ipv6': instance.ipv6,
      'active': instance.active,
      'activeLastTime': instance.activeLastTime,
      'isBlocked': instance.isBlocked,
      'linkTo': instance.linkTo,
      'linkType': instance.linkType,
      'linkSpeed': instance.linkSpeed,
      'linkWifiStandard': instance.linkWifiStandard,
      'linkSsidId': instance.linkSsidId,
      'linkRssi': instance.linkRssi,
      'allowAccess': instance.allowAccess,
      'denyAccessSchedules': instance.denyAccessSchedules,
      'tempAccessControl': instance.tempAccessControl,
    };

_$GetHostsResponseImpl _$$GetHostsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GetHostsResponseImpl(
  hosts: (json['hosts'] as List<dynamic>)
      .map((e) => HostModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$GetHostsResponseImplToJson(
  _$GetHostsResponseImpl instance,
) => <String, dynamic>{'hosts': instance.hosts};
