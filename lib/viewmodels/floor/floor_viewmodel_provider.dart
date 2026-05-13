import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/repositories/floor_repository.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';

final floorViewModelProvider =
    StateNotifierProvider<FloorViewModel, FloorState>((ref) {
  return FloorViewModel(ref.read(floorRepositoryProvider), ref);
});

final allFloorsProvider = FutureProvider<List<FloorModel>>((ref) async {
  final repository = ref.read(floorRepositoryProvider);
  return repository.getAllFloors();
});

class FloorViewModel extends StateNotifier<FloorState> {
  final FloorRepository _repository;
  final Ref _ref;

  FloorViewModel(this._repository, this._ref) : super(const FloorState.initial()) {
    loadActiveFloor();
  }

  void _refreshAllFloors() {
    _ref.invalidate(allFloorsProvider);
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

  void loadFloorById(String id) {
    state = const FloorState.loading();
    try {
      _repository.getFloorById(id).then((floor) {
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
      _refreshAllFloors();
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
        _refreshAllFloors();
      }
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }

  Future<void> updateRoom(int index, RoomModel room) async {
    final currentFloor = state.maybeWhen(
      loaded: (floor) => floor,
      orElse: () => null,
    );

    if (currentFloor == null) return;

    try {
      final rooms = List<RoomModel>.from(currentFloor.rooms);
      final existingIndex = rooms.indexWhere((r) => r.index == index);
      if (existingIndex >= 0) {
        rooms[existingIndex] = room;
      } else {
        rooms.add(room);
      }
      final updatedFloor =
          await _repository.updateRooms(currentFloor.id, rooms);
      if (updatedFloor != null) {
        state = FloorState.loaded(floor: updatedFloor);
        _refreshAllFloors();
      }
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }

  Future<void> deleteRoom(int index) async {
    final currentFloor = state.maybeWhen(
      loaded: (floor) => floor,
      orElse: () => null,
    );

    if (currentFloor == null) return;

    try {
      final rooms = List<RoomModel>.from(currentFloor.rooms);
      rooms.removeWhere((r) => r.index == index);
      final updatedFloor =
          await _repository.updateRooms(currentFloor.id, rooms);
      if (updatedFloor != null) {
        state = FloorState.loaded(floor: updatedFloor);
        _refreshAllFloors();
      }
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }

  Future<void> deleteFloor(String id) async {
    try {
      await _repository.deleteFloor(id);
      _refreshAllFloors();
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }
}
