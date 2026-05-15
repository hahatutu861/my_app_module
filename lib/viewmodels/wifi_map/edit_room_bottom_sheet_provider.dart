import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/utils/design/room_types.dart';
import 'package:my_app_module/models/room_model.dart';

final editRoomBottomSheetProvider =
    NotifierProvider<EditRoomBottomSheetViewModel,
        EditRoomBottomSheetState>(EditRoomBottomSheetViewModel.new);

class EditRoomBottomSheetState {
  final RoomType? selectedRoom;
  final bool? isGateway;
  final String roomName;

  const EditRoomBottomSheetState({
    this.selectedRoom,
    this.isGateway,
    this.roomName = '',
  });

  EditRoomBottomSheetState copyWith({
    RoomType? selectedRoom,
    bool? isGateway,
    bool clearIsGateway = false,
    String? roomName,
  }) {
    return EditRoomBottomSheetState(
      selectedRoom: selectedRoom ?? this.selectedRoom,
      isGateway: clearIsGateway ? null : (isGateway ?? this.isGateway),
      roomName: roomName ?? this.roomName,
    );
  }
}

class EditRoomBottomSheetViewModel
    extends Notifier<EditRoomBottomSheetState> {
  @override
  EditRoomBottomSheetState build() {
    ref.onDispose(() {});
    return const EditRoomBottomSheetState();
  }

  void initWithRoom(RoomModel? room) {
    if (room == null) {
      state = EditRoomBottomSheetState(
        selectedRoom: RoomType.values.first
      );
      return;
    }

    final roomType = RoomType.values.firstWhere(
      (e) => e.name == room.roomType,
      orElse: () => RoomType.values.first,
    );

    state = EditRoomBottomSheetState(
      selectedRoom: roomType,
      isGateway: room.isGateway,
      roomName: room.roomName,
    );
  }

  void selectRoom(RoomType room, BuildContext context) {
    final roomName = room.getDisplayName(context);
    state = state.copyWith(selectedRoom: room, roomName: roomName);
  }

  void updateRoomName(String name) {
    state = state.copyWith(roomName: name);
  }

  void setIsGateway(bool? isGateway) {
    state = state.copyWith(
      isGateway: isGateway,
      clearIsGateway: isGateway == null,
    );
  }
}
