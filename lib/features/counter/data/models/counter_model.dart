import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/features/counter/domain/entities/counter.dart';

part 'counter_model.freezed.dart';
part 'counter_model.g.dart';

@freezed
class CounterModel with _$CounterModel {
  @JsonSerializable()
  const factory CounterModel({required int value}) = _CounterModel;

  factory CounterModel.fromJson(Map<String, dynamic> json) =>
      _$CounterModelFromJson(json);
}

// 扩展方法：DTO -> Entity
extension CounterModelX on CounterModel {
  Counter toEntity() => Counter(value: value);
}

// 扩展方法：Entity -> DTO
extension CounterX on Counter {
  CounterModel toModel() => CounterModel(value: value);
}
