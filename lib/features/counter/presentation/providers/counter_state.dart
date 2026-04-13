import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/features/counter/domain/entities/counter.dart';

part 'counter_state.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial() = _Initial;
  const factory CounterState.loading() = _Loading;
  const factory CounterState.loaded({required Counter counter}) = _Loaded;
  const factory CounterState.error({required String message}) = _Error;
}
