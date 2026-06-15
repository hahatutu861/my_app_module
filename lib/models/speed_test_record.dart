import 'package:freezed_annotation/freezed_annotation.dart';

part 'speed_test_record.freezed.dart';

part 'speed_test_record.g.dart';

@freezed
abstract class SpeedTestRecord with _$SpeedTestRecord {
  const factory SpeedTestRecord({
    required double speed,
    String? band,
    int? channel,
    int? rssi,
    required DateTime timestamp,
  }) = _SpeedTestRecord;

  factory SpeedTestRecord.fromJson(Map<String, dynamic> json) =>
      _$SpeedTestRecordFromJson(json);
}
