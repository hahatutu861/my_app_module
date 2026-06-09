import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_speed_state.freezed.dart';

enum WifiSpeedLevel { good, moderate, weak }

@freezed
sealed class WifiSpeedState with _$WifiSpeedState {
  const WifiSpeedState._();

  const factory WifiSpeedState({
    @Default(false) bool isTesting,
    @Default(null) double? speed,
    @Default(true) bool isSuccess,
    @Default(null) String? errorMessage,
    @Default(0) int progress,
    @Default([]) List<double> samples,
  }) = _WifiSpeedState;

  String get displaySpeed {
    if (speed == null || speed! < 0) return "--";
    return speed!.toStringAsFixed(1);
  }

  WifiSpeedLevel? get level {
    if (speed == null || speed! < 0) return null;
    if (speed! >= 50) return WifiSpeedLevel.good;
    if (speed! >= 10) return WifiSpeedLevel.moderate;
    return WifiSpeedLevel.weak;
  }
}
