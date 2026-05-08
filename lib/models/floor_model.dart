import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/room_model.dart';

part 'floor_model.freezed.dart';
part 'floor_model.g.dart';

@freezed
class FloorModel with _$FloorModel {
  const factory FloorModel({
    required String id,
    required String floorName,
    @Default(0) int zoneCount,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default([]) List<RoomModel> rooms,
  }) = _FloorModel;

  factory FloorModel.fromJson(Map<String, dynamic> json) =>
      _$FloorModelFromJson(json);
}
