import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_model.freezed.dart';

part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required int index,
    required String roomType,
    required String roomName,
    bool? isGateway,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);
}
