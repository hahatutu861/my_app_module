import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';

part 'floor_state.freezed.dart';

enum WifiViewMode { quality, speed }

class RoomFitContext {
  final bool hasCurrentRooms;
  final bool hasReferenceRooms;
  final bool shouldUseReference;
  final bool isFloorMatch;
  final bool hasNoRoomsAtAll;
  final bool isDataReady;
  final List<RoomModel>? previousFloorRooms;

  const RoomFitContext({
    required this.hasCurrentRooms,
    required this.hasReferenceRooms,
    required this.shouldUseReference,
    required this.isFloorMatch,
    required this.hasNoRoomsAtAll,
    required this.isDataReady,
    this.previousFloorRooms,
  });

  bool get shouldFitToRooms => isFloorMatch && isDataReady;
}

@freezed
sealed class FloorState with _$FloorState {
  const factory FloorState.initial() = FloorStateInitial;
  const factory FloorState.loading() = FloorStateLoading;
  const factory FloorState.loaded({
    FloorModel? floor,
    int? selectedRoomIndex,
    @Default(false) bool isReferenceEnabled,
    @Default(0) int bubbleTrigger,
    @Default(false) bool hasFittedToRooms,
    @Default(WifiViewMode.quality) WifiViewMode wifiViewMode,
  }) = FloorStateLoaded;
  const factory FloorState.error({required String message}) = FloorStateError;
}
