// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => _RoomModel(
  index: (json['index'] as num).toInt(),
  roomType: $enumDecode(_$RoomTypeEnumMap, json['roomType']),
  roomName: json['roomName'] as String,
  isGateway: json['isGateway'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  records:
      (json['records'] as List<dynamic>?)
          ?.map((e) => SpeedTestRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RoomModelToJson(_RoomModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'roomType': _$RoomTypeEnumMap[instance.roomType]!,
      'roomName': instance.roomName,
      'isGateway': instance.isGateway,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'records': instance.records,
    };

const _$RoomTypeEnumMap = {
  RoomType.backyard: 'backyard',
  RoomType.bathroom: 'bathroom',
  RoomType.bedroom: 'bedroom',
  RoomType.diningRoom: 'diningRoom',
  RoomType.dressingRoom: 'dressingRoom',
  RoomType.games: 'games',
  RoomType.garage: 'garage',
  RoomType.gym: 'gym',
  RoomType.homeTheater: 'homeTheater',
  RoomType.kitchen: 'kitchen',
  RoomType.livingRoom: 'livingRoom',
  RoomType.lobby: 'lobby',
  RoomType.office: 'office',
  RoomType.patio: 'patio',
  RoomType.pool: 'pool',
  RoomType.stairs: 'stairs',
  RoomType.storage: 'storage',
  RoomType.utility: 'utility',
};
