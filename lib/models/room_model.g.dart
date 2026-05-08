// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomModelImpl _$$RoomModelImplFromJson(Map<String, dynamic> json) =>
    _$RoomModelImpl(
      index: (json['index'] as num).toInt(),
      roomType: json['roomType'] as String,
      roomName: json['roomName'] as String,
      isGateway: json['isGateway'] as bool?,
    );

Map<String, dynamic> _$$RoomModelImplToJson(_$RoomModelImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'roomType': instance.roomType,
      'roomName': instance.roomName,
      'isGateway': instance.isGateway,
    };
