import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/repositories/floor_repository.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';

final floorViewModelProvider = NotifierProvider<FloorViewModel, FloorState>(
  FloorViewModel.new,
);

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

  int? get selectedRoomIndex => switch (state) {
    FloorStateLoaded(:final selectedRoomIndex) => selectedRoomIndex,
    _ => null,
  };

  void selectRoom(int? index) {
    state = switch (state) {
      FloorStateLoaded(:final floor) => FloorState.loaded(
        floor: floor,
        selectedRoomIndex: index,
      ),
      _ => state,
    };
  }

  void _refreshAllFloors() {
    _ref.invalidate(allFloorsProvider);
  }

  void loadActiveFloor() {
    state = const FloorState.loading();
    try {
      _repository
          .getActiveFloor()
          .then((floor) {
            final hasPrevFloor = _hasPreviousFloorWithRoomsFor(floor);
            final isReferenceEnabled =
                floor != null && floor.rooms.isEmpty && hasPrevFloor;
            state = FloorState.loaded(
              floor: floor,
              isReferenceEnabled: isReferenceEnabled,
              bubbleTrigger: isReferenceEnabled ? 1 : 0,
            );
          })
          .catchError((e) {
            state = FloorState.error(message: e.toString());
          });
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }

  void loadFloorById(String id) {
    state = const FloorState.loading();
    try {
      _repository
          .getFloorById(id)
          .then((floor) {
            final hasPrevFloor = _hasPreviousFloorWithRoomsFor(floor);
            final isReferenceEnabled =
                floor != null && floor.rooms.isEmpty && hasPrevFloor;
            state = FloorState.loaded(
              floor: floor,
              isReferenceEnabled: isReferenceEnabled,
              bubbleTrigger: isReferenceEnabled ? 1 : 0,
            );
          })
          .catchError((e) {
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
    final currentFloor = switch (state) {
      FloorStateLoaded(:final floor) => floor,
      _ => null,
    };

    if (currentFloor == null) return;

    try {
      final updatedFloor = await _repository.updateFloorName(
        currentFloor.id,
        newName,
      );
      if (updatedFloor != null) {
        state = switch (state) {
          FloorStateLoaded(:final selectedRoomIndex) => FloorState.loaded(
            floor: updatedFloor,
            selectedRoomIndex: selectedRoomIndex,
          ),
          _ => FloorState.loaded(floor: updatedFloor),
        };
        _refreshAllFloors();
      }
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }

  Future<void> updateRoom(int index, RoomModel room) async {
    final currentFloor = switch (state) {
      FloorStateLoaded(:final floor) => floor,
      _ => null,
    };

    if (currentFloor == null) return;

    try {
      final rooms = List<RoomModel>.from(currentFloor.rooms);
      final existingIndex = rooms.indexWhere((r) => r.index == index);
      if (existingIndex >= 0) {
        rooms[existingIndex] = room;
      } else {
        rooms.add(room);
      }
      final updatedFloor = await _repository.updateRooms(
        currentFloor.id,
        rooms,
      );
      if (updatedFloor != null) {
        state = switch (state) {
          FloorStateLoaded(:final selectedRoomIndex) => FloorState.loaded(
            floor: updatedFloor,
            selectedRoomIndex: selectedRoomIndex,
          ),
          _ => FloorState.loaded(floor: updatedFloor),
        };
        _refreshAllFloors();
      }
    } catch (e) {
      state = FloorState.error(message: e.toString());
    }
  }

  Future<void> deleteRoom(int index) async {
    final currentFloor = switch (state) {
      FloorStateLoaded(:final floor) => floor,
      _ => null,
    };

    if (currentFloor == null) return;

    try {
      final rooms = List<RoomModel>.from(currentFloor.rooms);
      rooms.removeWhere((r) => r.index == index);
      final updatedFloor = await _repository.updateRooms(
        currentFloor.id,
        rooms,
      );
      if (updatedFloor != null) {
        state = switch (state) {
          FloorStateLoaded(:final selectedRoomIndex) => FloorState.loaded(
            floor: updatedFloor,
            selectedRoomIndex: selectedRoomIndex,
          ),
          _ => FloorState.loaded(floor: updatedFloor),
        };
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

  FloorModel? getPreviousFloorWithRooms([FloorModel? forFloor]) {
    final allFloorsAsync = _ref.read(allFloorsProvider);
    final allFloors = allFloorsAsync.hasValue ? allFloorsAsync.value : null;
    if (allFloors == null) return null;
    final targetFloor =
        forFloor ??
        switch (state) {
          FloorStateLoaded(:final floor) => floor,
          _ => null,
        };

    if (targetFloor == null) return null;

    final sortedFloors = List<FloorModel>.from(allFloors)
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    final currentIndex = sortedFloors.indexWhere((f) => f.id == targetFloor.id);
    if (currentIndex <= 0) return null;

    final previousFloor = sortedFloors[currentIndex - 1];
    if (previousFloor.rooms.isEmpty) return null;

    return previousFloor;
  }

  FloorModel? get currentFloor {
    return switch (state) {
      FloorStateLoaded(:final floor) => floor,
      _ => null,
    };
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

  bool _hasPreviousFloorWithRoomsFor(FloorModel? floor) {
    return getPreviousFloorWithRooms(floor) != null;
  }

  RoomModel? getRoomByIndex(int index) {
    final rooms = currentRooms;
    final matched = rooms.where((r) => r.index == index);
    return matched.isNotEmpty ? matched.first : null;
  }

  Map<int, RoomModel> get roomsMap {
    final rooms = currentRooms;
    return {for (var r in rooms) r.index: r};
  }

  void toggleReference() {
    state = switch (state) {
      FloorStateLoaded(
        :final floor,
        :final selectedRoomIndex,
        :final isReferenceEnabled,
        :final bubbleTrigger
      ) =>
        FloorState.loaded(
          floor: floor,
          selectedRoomIndex: selectedRoomIndex,
          isReferenceEnabled: !isReferenceEnabled,
          bubbleTrigger: bubbleTrigger + 1,
        ),
      _ => state,
    };
  }

  bool get isReferenceEnabled => switch (state) {
    FloorStateLoaded(:final isReferenceEnabled) => isReferenceEnabled,
    _ => false,
  };

  int get bubbleTrigger => switch (state) {
    FloorStateLoaded(:final bubbleTrigger) => bubbleTrigger,
    _ => 0,
  };

  Set<int> get referenceIndices {
    if (!isReferenceEnabled) return {};
    final prevFloor = getPreviousFloorWithRooms();
    if (prevFloor == null) return {};
    return prevFloor.rooms.map((r) => r.index).toSet();
  }
}
