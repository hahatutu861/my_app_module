import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/features/counter/data/repositories/counter_repository.dart';
import 'package:my_app_module/features/counter/presentation/providers/counter_state.dart';

/// Counter Repository Provider
final counterRepositoryProvider = Provider<CounterRepository>((ref) {
  return CounterRepository();
});

/// Counter ViewModel Provider (MVVM 架构)
/// 使用 Riverpod 2.6.1 的 StateNotifier API
final counterViewModelProvider =
    StateNotifierProvider<CounterViewModel, CounterState>((ref) {
      final repository = ref.watch(counterRepositoryProvider);
      return CounterViewModel(repository);
    });

/// Counter ViewModel
/// 业务逻辑层，替代 UseCase
class CounterViewModel extends StateNotifier<CounterState> {
  final CounterRepository _repository;

  CounterViewModel(this._repository) : super(const CounterState.initial()) {
    loadCounter();
  }

  /// 加载计数器值
  Future<void> loadCounter() async {
    state = const CounterState.loading();
    try {
      final counter = await _repository.getCounter();
      state = CounterState.loaded(counter: counter);
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }

  /// 增加计数
  Future<void> increment() async {
    try {
      final counter = await _repository.incrementCounter();
      state = CounterState.loaded(counter: counter);
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }

  /// 减少计数
  Future<void> decrement() async {
    try {
      final counter = await _repository.decrementCounter();
      state = CounterState.loaded(counter: counter);
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }

  /// 重置计数
  Future<void> reset() async {
    try {
      await _repository.resetCounter();
      await loadCounter();
    } catch (e) {
      state = CounterState.error(message: e.toString());
    }
  }
}
