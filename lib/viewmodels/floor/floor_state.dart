import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/floor_model.dart';

part 'floor_state.freezed.dart';

@freezed
sealed class FloorState with _$FloorState {
  const factory FloorState.initial() = FloorStateInitial;
  const factory FloorState.loading() = FloorStateLoading;
  const factory FloorState.loaded({
    FloorModel? floor,
    int? selectedRoomIndex,
    @Default(false) bool isReferenceEnabled,
    @Default(0) int bubbleTrigger,
  }) = FloorStateLoaded;
  const factory FloorState.error({required String message}) = FloorStateError;
}
