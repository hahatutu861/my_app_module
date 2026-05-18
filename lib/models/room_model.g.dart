// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => _RoomModel(
  index: (json['index'] as num).toInt(),
  roomType: json['roomType'] as String,
  roomName: json['roomName'] as String,
  isGateway: json['isGateway'] as bool?,
);

Map<String, dynamic> _$RoomModelToJson(_RoomModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'roomType': instance.roomType,
      'roomName': instance.roomName,
      'isGateway': instance.isGateway,
    };
