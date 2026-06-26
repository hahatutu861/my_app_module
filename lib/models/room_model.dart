import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/speed_test_record.dart';
import 'package:my_app_module/utils/design/room_types.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_state.dart';

part 'room_model.freezed.dart';

part 'room_model.g.dart';

@freezed
abstract class RoomModel with _$RoomModel {
  const factory RoomModel({
    required int index,
    required String roomType,
    required String roomName,
    bool? isGateway,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<SpeedTestRecord> records,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);
}

extension RoomModelExtension on RoomModel {
  RoomType get roomTypeEnum {
    return RoomType.values.firstWhere(
      (e) => e.name == roomType,
      orElse: () => RoomType.backyard,
    );
  }

  WifiSpeedLevel? get speedLevel {
    if (records.isEmpty) return null;
    final speed = records.last.speed;
    if (speed >= 50) return WifiSpeedLevel.good;
    if (speed >= 10) return WifiSpeedLevel.moderate;
    return WifiSpeedLevel.weak;
  }

  String get speedStatusIcon {
    final level = speedLevel;
    if (level == null || level == WifiSpeedLevel.good) return 'good.png';
    if (level == WifiSpeedLevel.moderate) return 'warning.webp';
    return 'weak.webp';
  }

  String get speedStatusTextKey {
    final level = speedLevel;
    if (level == null || level == WifiSpeedLevel.good) return 'wifiSpeedGoodStatus';
    if (level == WifiSpeedLevel.moderate) return 'wifiSpeedModerateStatus';
    return 'wifiSpeedWeakStatus';
  }
}

extension RoomListSpeedStats on List<RoomModel> {
  Map<WifiSpeedLevel?, int> get speedLevelCounts {
    final Map<WifiSpeedLevel?, int> counts = {
      WifiSpeedLevel.good: 0,
      WifiSpeedLevel.moderate: 0,
      WifiSpeedLevel.weak: 0,
      null: 0,
    };
    for (final RoomModel room in this) {
      final WifiSpeedLevel? level = room.speedLevel;
      counts[level] = (counts[level] ?? 0) + 1;
    }
    return counts;
  }
}
