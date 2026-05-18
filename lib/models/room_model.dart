import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/utils/design/room_types.dart';

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

extension RoomModelExtension on RoomModel {
  RoomType get roomTypeEnum {
    return RoomType.values.firstWhere(
      (e) => e.name == roomType,
      orElse: () => RoomType.backyard,
    );
  }
}
