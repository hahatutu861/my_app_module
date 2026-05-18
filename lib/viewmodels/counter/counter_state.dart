import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app_module/models/counter_model.dart';

part 'counter_state.freezed.dart';

@freezed
sealed class CounterState with _$CounterState {
  const factory CounterState.initial() = CounterStateInitial;
  const factory CounterState.loading() = CounterStateLoading;
  const factory CounterState.loaded({required CounterModel counter}) = CounterStateLoaded;
  const factory CounterState.error({required String message}) = CounterStateError;
}
