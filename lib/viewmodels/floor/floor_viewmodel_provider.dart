import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/repositories/floor_repository.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';

final floorViewModelProvider =
    NotifierProvider<FloorViewModel, FloorState>(FloorViewModel.new);

final allFloorsProvider = FutureProvider<List<FloorModel>>((ref) async {
  final repository = ref.read(floorRepositoryProvider);
  return repository.getAllFloors();
});

class FloorViewModel extends Notifier<FloorState> {
  late final FloorRepository _repository;
  late final Ref _ref;

  @override
  FloorState build() {
    _repository = ref.read(floorRepositoryProvider);
    _ref = ref;
    loadActiveFloor();
    return const FloorState.initial();
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

  void loadFloor(String? floorId) {
    if (floorId != null && floorId.isNotEmpty) {
      loadFloorById(floorId);
    } else {
      loadActiveFloor();
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

  FloorModel? getPreviousFloorWithRooms() {
    final allFloorsAsync = _ref.read(allFloorsProvider);
    final allFloors = allFloorsAsync.hasValue ? allFloorsAsync.value : null;
    if (allFloors == null) return null;

    final currentFloor = state.maybeWhen(
      loaded: (floor) => floor,
      orElse: () => null,
    );

    if (currentFloor == null) return null;

    final sortedFloors = List<FloorModel>.from(allFloors)
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    final currentIndex = sortedFloors.indexWhere((f) => f.id == currentFloor.id);
    if (currentIndex <= 0) return null;

    final previousFloor = sortedFloors[currentIndex - 1];
    if (previousFloor.rooms.isEmpty) return null;

    return previousFloor;
  }

  FloorModel? get currentFloor {
    return state.maybeWhen(
      loaded: (floor) => floor,
      orElse: () => null,
    );
  }

  List<RoomModel> get currentRooms {
    return currentFloor?.rooms ?? [];
  }

  bool get hasCurrentFloorRooms {
    return currentRooms.isNotEmpty;
  }

  bool get hasPreviousFloorWithRooms {
    return getPreviousFloorWithRooms() != null;
  }

  RoomModel? getRoomByIndex(int index) {
    final rooms = currentRooms;
    final matched = rooms.where((r) => r.index == index);
    return matched.isNotEmpty ? matched.first : null;
  }
}
