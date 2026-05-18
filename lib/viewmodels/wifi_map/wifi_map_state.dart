import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/host_model.dart';

part 'wifi_map_state.freezed.dart';

@freezed
sealed class WifiMapState with _$WifiMapState {
  const factory WifiMapState.initial() = WifiMapStateInitial;
  const factory WifiMapState.loading() = WifiMapStateLoading;
  const factory WifiMapState.loaded({required List<HostModel> hosts}) = WifiMapStateLoaded;
  const factory WifiMapState.error({required String message}) = WifiMapStateError;
}
