import 'package:my_app_module/models/counter_model.dart';

class CounterRepository {
  int _counterValue = 0;

  CounterModel getCounter() {
    return CounterModel(value: _counterValue);
  }

  CounterModel incrementCounter() {
    _counterValue++;
    return CounterModel(value: _counterValue);
  }

  CounterModel decrementCounter() {
    _counterValue--;
    return CounterModel(value: _counterValue);
  }

  void resetCounter() {
    _counterValue = 0;
  }
}
