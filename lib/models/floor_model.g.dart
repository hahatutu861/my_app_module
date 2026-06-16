// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FloorModel _$FloorModelFromJson(Map<String, dynamic> json) => _FloorModel(
  id: json['id'] as String,
  floorName: json['floorName'] as String,
  zoneCount: (json['zoneCount'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  rooms:
      (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  deviceId: json['deviceId'] as String?,
);

Map<String, dynamic> _$FloorModelToJson(_FloorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floorName': instance.floorName,
      'zoneCount': instance.zoneCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rooms': instance.rooms,
      'deviceId': instance.deviceId,
    };
