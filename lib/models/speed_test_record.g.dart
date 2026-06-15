// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_test_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeedTestRecord _$SpeedTestRecordFromJson(Map<String, dynamic> json) =>
    _SpeedTestRecord(
      speed: (json['speed'] as num).toDouble(),
      band: json['band'] as String?,
      channel: (json['channel'] as num?)?.toInt(),
      rssi: (json['rssi'] as num?)?.toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$SpeedTestRecordToJson(_SpeedTestRecord instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'band': instance.band,
      'channel': instance.channel,
      'rssi': instance.rssi,
      'timestamp': instance.timestamp.toIso8601String(),
    };
