import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/repositories/floor_repository.dart';
import 'package:my_app_module/viewmodels/floor/floor_state.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_state.dart';

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
          .then((floor) async {
            final hasPrevFloor = await _hasPreviousFloorWithRoomsForAsync(floor);
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
          .then((floor) async {
            final hasPrevFloor = await _hasPreviousFloorWithRoomsForAsync(floor);
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
      _refreshAllFloors();
      final hasPrevFloor = await _hasPreviousFloorWithRoomsForAsync(floor);
      final isReferenceEnabled = floor.rooms.isEmpty && hasPrevFloor;
      state = FloorState.loaded(
        floor: floor,
        isReferenceEnabled: isReferenceEnabled,
        bubbleTrigger: isReferenceEnabled ? 1 : 0,
      );
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
      final stampedRoom = room.copyWith(updatedAt: DateTime.now());
      final existingIndex = rooms.indexWhere((r) => r.index == index);
      if (existingIndex >= 0) {
        rooms[existingIndex] = stampedRoom;
      } else {
        rooms.add(stampedRoom);
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

  Map<WifiSpeedLevel?, int> get roomSpeedLevelCounts =>
      currentRooms.speedLevelCounts;

  bool get hasCurrentFloorRooms {
    return currentRooms.isNotEmpty;
  }

  bool get hasPreviousFloorWithRooms {
    return getPreviousFloorWithRooms() != null;
  }

  Future<bool> _hasPreviousFloorWithRoomsForAsync(FloorModel? floor) async {
    if (floor == null) return false;
    final allFloorsAsync = _ref.read(allFloorsProvider);
    final allFloors = allFloorsAsync.hasValue ? allFloorsAsync.value : null;
    if (allFloors == null || allFloors.every((f) => f.id != floor.id)) {
      _ref.invalidate(allFloorsProvider);
      final refreshedAsync = await _ref.read(allFloorsProvider.future);
      if (refreshedAsync.every((f) => f.id != floor.id)) {
        return false;
      }
    }
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

  RoomFitContext getRoomFitContext(String? currentFloorId) {
    final hasCurrentRooms = roomsMap.isNotEmpty;
    final previousFloor = getPreviousFloorWithRooms();
    final hasReferenceRooms = previousFloor != null && previousFloor.rooms.isNotEmpty;
    final shouldUseReference = hasReferenceRooms && isReferenceEnabled;
    final loadedState = state is FloorStateLoaded ? state : null;
    final isFloorMatch = currentFloorId != null && loadedState is FloorStateLoaded && loadedState.floor?.id == currentFloorId;
    final hasNoRoomsAtAll = !hasCurrentRooms && !hasReferenceRooms;
    final allFloorsAsync = _ref.read(allFloorsProvider);
    final allFloorsContainsCurrent =
        allFloorsAsync.hasValue &&
        (allFloorsAsync.value?.any((f) => f.id == currentFloorId) ?? false);
    final isDataReady = hasCurrentRooms || allFloorsContainsCurrent;

    return RoomFitContext(
      hasCurrentRooms: hasCurrentRooms,
      hasReferenceRooms: hasReferenceRooms,
      shouldUseReference: shouldUseReference,
      isFloorMatch: isFloorMatch,
      hasNoRoomsAtAll: hasNoRoomsAtAll,
      isDataReady: isDataReady,
      previousFloorRooms: previousFloor?.rooms,
    );
  }

  Map<int, RoomModel> getTargetRoomsForFitting(RoomFitContext context) {
    if (context.hasCurrentRooms) {
      return roomsMap;
    } else if (context.shouldUseReference && context.previousFloorRooms != null) {
      return {for (var r in context.previousFloorRooms!) r.index: r};
    } else if (context.hasNoRoomsAtAll) {
      return {};
    }
    return {};
  }

  Matrix4 calculateFitTransform({
    required Map<int, RoomModel> roomsMap,
    required Size viewportSize,
    required double squareSize,
    required double spacing,
    required double padding,
    required bool shouldTranslate,
    int crossAxisCount = 10,
  }) {
    if (roomsMap.isEmpty) {
      if (!shouldTranslate) {
        return Matrix4.identity()..scaleByDouble(2.5, 2.5, 1.0, 1.0);
      }
      return Matrix4.identity();
    }

    final indices = roomsMap.keys.toList();

    int minRow = 110 ~/ crossAxisCount;
    int maxRow = 0;
    int minCol = crossAxisCount - 1;
    int maxCol = 0;

    for (final index in indices) {
      final row = index ~/ crossAxisCount;
      final col = index % crossAxisCount;
      if (row < minRow) minRow = row;
      if (row > maxRow) maxRow = row;
      if (col < minCol) minCol = col;
      if (col > maxCol) maxCol = col;
    }

    final double cellSizeWithSpacing = squareSize + spacing;
    final double boundsWidth = (maxCol - minCol + 1) * squareSize + (maxCol - minCol) * spacing;
    final double boundsHeight = (maxRow - minRow + 1) * squareSize + (maxRow - minRow) * spacing;

    final double boundsCenterX = padding + minCol * cellSizeWithSpacing + boundsWidth / 2;
    final double boundsCenterY = minRow * cellSizeWithSpacing + boundsHeight / 2;

    double scale = 1.0;
    if (boundsWidth > 0 && boundsHeight > 0) {
      final scaleX = viewportSize.width / boundsWidth;
      final scaleY = viewportSize.height / boundsHeight;
      scale = scaleX < scaleY ? scaleX : scaleY;
      if (scale < 1.0) scale = 1.0;
      if (scale > 2.5) scale = 2.5;
    }

    double tx = viewportSize.width / 2 - scale * boundsCenterX;
    double ty = viewportSize.height / 2 - scale * boundsCenterY;

    final double contentWidth = viewportSize.width;
    final double contentHeight = viewportSize.height;

    if (scale * contentWidth > viewportSize.width) {
      tx = tx.clamp(viewportSize.width - scale * contentWidth, 0.0);
    } else {
      tx = (viewportSize.width - scale * contentWidth) / 2;
    }

    if (scale * contentHeight > viewportSize.height) {
      ty = ty.clamp(viewportSize.height - scale * contentHeight, 0.0);
    } else {
      ty = (viewportSize.height - scale * contentHeight) / 2;
    }

    return Matrix4.identity()
      ..setEntry(0, 3, tx)
      ..setEntry(1, 3, ty)
      ..setEntry(0, 0, scale)
      ..setEntry(1, 1, scale)
      ..setEntry(2, 2, 1.0);
  }
}
