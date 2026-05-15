import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/repositories/counter_repository.dart';

import 'counter_state.dart';

final counterRepositoryProvider = Provider<CounterRepository>((ref) {
  return CounterRepository();
});

final counterViewModelProvider =
    NotifierProvider<CounterViewModel, CounterState>(CounterViewModel.new);

class CounterViewModel extends Notifier<CounterState> {
  late final CounterRepository _repository;

  @override
  CounterState build() {
    _repository = ref.read(counterRepositoryProvider);
    loadCounter();
    return const CounterState.initial();
  }

  void loadCounter() {
    state = const CounterState.loading();
    try {
      final counter = _repository.getCounter();
      state = CounterState.loaded(counter: counter);
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }

  void increment() {
    try {
      final counter = _repository.incrementCounter();
      state = CounterState.loaded(counter: counter);
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }

  void decrement() {
    try {
      final counter = _repository.decrementCounter();
      state = CounterState.loaded(counter: counter);
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }

  void reset() {
    try {
      _repository.resetCounter();
      loadCounter();
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }
}
