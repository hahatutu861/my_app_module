import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/utils/design/room_types.dart';

final editRoomBottomSheetProvider =
    StateNotifierProvider.autoDispose<EditRoomBottomSheetViewModel,
        EditRoomBottomSheetState>((ref) {
  return EditRoomBottomSheetViewModel();
});

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
    String? roomName,
  }) {
    return EditRoomBottomSheetState(
      selectedRoom: selectedRoom ?? this.selectedRoom,
      isGateway: isGateway ?? this.isGateway,
      roomName: roomName ?? this.roomName,
    );
  }
}

class EditRoomBottomSheetViewModel
    extends StateNotifier<EditRoomBottomSheetState> {
  EditRoomBottomSheetViewModel()
      : super(EditRoomBottomSheetState(selectedRoom: RoomType.values.first));

  void selectRoom(RoomType room, BuildContext context) {
    final roomName = room.getDisplayName(context);
    state = state.copyWith(selectedRoom: room, roomName: roomName);
  }

  void updateRoomName(String name) {
    state = state.copyWith(roomName: name);
  }

  void setIsGateway(bool isGateway) {
    state = state.copyWith(isGateway: isGateway);
  }
}
