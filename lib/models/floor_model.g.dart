// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FloorModelImpl _$$FloorModelImplFromJson(Map<String, dynamic> json) =>
    _$FloorModelImpl(
      id: json['id'] as String,
      floorName: json['floorName'] as String,
      zoneCount: (json['zoneCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FloorModelImplToJson(_$FloorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floorName': instance.floorName,
      'zoneCount': instance.zoneCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
