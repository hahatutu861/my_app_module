import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/utils/design/room_types.dart';

final editRoomBottomSheetProvider =
    StateNotifierProvider.autoDispose<EditRoomBottomSheetViewModel,
        EditRoomBottomSheetState>((ref) {
  return EditRoomBottomSheetViewModel();
});

class EditRoomBottomSheetState {
  final RoomType? selectedRoom;
  final bool isGateway;

  const EditRoomBottomSheetState({
    this.selectedRoom,
    this.isGateway = true,
  });

  EditRoomBottomSheetState copyWith({
    RoomType? selectedRoom,
    bool? isGateway,
  }) {
    return EditRoomBottomSheetState(
      selectedRoom: selectedRoom ?? this.selectedRoom,
      isGateway: isGateway ?? this.isGateway,
    );
  }
}

class EditRoomBottomSheetViewModel
    extends StateNotifier<EditRoomBottomSheetState> {
  EditRoomBottomSheetViewModel()
      : super(const EditRoomBottomSheetState(isGateway: true));

  void selectRoom(RoomType room) {
    state = state.copyWith(selectedRoom: room);
  }

  void setIsGateway(bool isGateway) {
    state = state.copyWith(isGateway: isGateway);
  }
}
