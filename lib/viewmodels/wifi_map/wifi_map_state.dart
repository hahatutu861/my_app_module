import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/host_model.dart';

part 'wifi_map_state.freezed.dart';

@freezed
class WifiMapState with _$WifiMapState {
  const factory WifiMapState.initial() = _Initial;
  const factory WifiMapState.loading() = _Loading;
  const factory WifiMapState.loaded({required List<HostModel> hosts}) = _Loaded;
  const factory WifiMapState.error({required String message}) = _Error;
}
