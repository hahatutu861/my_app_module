import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/repositories/floor_repository.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';

final floorViewModelProvider =
    StateNotifierProvider<FloorViewModel, FloorState>((ref) {
  return FloorViewModel(ref.read(floorRepositoryProvider));
});

class FloorViewModel extends StateNotifier<FloorState> {
  final FloorRepository _repository;

  FloorViewModel(this._repository) : super(const FloorState.initial()) {
    loadActiveFloor();
  }

  void loadActiveFloor() {
    state = const FloorState.loading();
    try {
      _repository.getActiveFloor().then((floor) {
        state = FloorState.loaded(floor: floor);
      }).catchError((e) {
        state = FloorState.error(message: e.toString());
      });
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }

  Future<FloorModel?> createFloor(String floorName) async {
    try {
      final floor = await _repository.createFloor(floorName);
      state = FloorState.loaded(floor: floor);
      return floor;
    } catch (e) {
      state = FloorState.error(message: e.toString());
      return null;
    }
  }

  Future<void> updateFloorName(String newName) async {
    final currentFloor = state.maybeWhen(
      loaded: (floor) => floor,
      orElse: () => null,
    );

    if (currentFloor == null) return;

    try {
      final updatedFloor =
          await _repository.updateFloorName(currentFloor.id, newName);
      if (updatedFloor != null) {
        state = FloorState.loaded(floor: updatedFloor);
      }
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }
}
