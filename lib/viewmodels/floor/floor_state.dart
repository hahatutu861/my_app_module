import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/floor_model.dart';

part 'floor_state.freezed.dart';

@freezed
class FloorState with _$FloorState {
  const factory FloorState.initial() = _Initial;
  const factory FloorState.loading() = _Loading;
  const factory FloorState.loaded({FloorModel? floor}) = _Loaded;
  const factory FloorState.error({required String message}) = _Error;
}
