import 'package:my_app_module/features/counter/data/models/counter_model.dart';

abstract class CounterLocalDataSource {
  Future<CounterModel> getCounter();
  Future<CounterModel> incrementCounter();
  Future<CounterModel> decrementCounter();
  Future<void> saveCounter(CounterModel counter);
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  int _counterValue = 0;

  @override
  Future<CounterModel> getCounter() async {
    return CounterModel(value: _counterValue);
  }

  @override
  Future<CounterModel> incrementCounter() async {
    _counterValue++;
    await saveCounter(CounterModel(value: _counterValue));
    return CounterModel(value: _counterValue);
  }

  @override
  Future<CounterModel> decrementCounter() async {
    _counterValue--;
    await saveCounter(CounterModel(value: _counterValue));
    return CounterModel(value: _counterValue);
  }

  @override
  Future<void> saveCounter(CounterModel counter) async {
    _counterValue = counter.value;
  }
}
