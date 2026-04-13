import 'package:my_app_module/features/counter/data/datasources/counter_local_datasource.dart';
import 'package:my_app_module/features/counter/data/models/counter_model.dart';
import 'package:my_app_module/features/counter/domain/entities/counter.dart';

/// Counter 仓储（MVVM 架构）
/// 简化版：直接使用 Entity，移除 Model 转换层
class CounterRepository {
  final CounterLocalDataSource _localDataSource;

  CounterRepository({CounterLocalDataSource? localDataSource})
    : _localDataSource = localDataSource ?? CounterLocalDataSourceImpl();

  /// 获取计数器值
  Future<Counter> getCounter() async {
    try {
      final counterModel = await _localDataSource.getCounter();
      return Counter(value: counterModel.value);
    } catch (e) {
      throw Exception('获取计数器失败: $e');
    }
  }

  /// 增加计数
  Future<Counter> incrementCounter() async {
    try {
      final counterModel = await _localDataSource.incrementCounter();
      return Counter(value: counterModel.value);
    } catch (e) {
      throw Exception('增加计数失败: $e');
    }
  }

  /// 减少计数
  Future<Counter> decrementCounter() async {
    try {
      final counterModel = await _localDataSource.decrementCounter();
      return Counter(value: counterModel.value);
    } catch (e) {
      throw Exception('减少计数失败: $e');
    }
  }

  /// 重置计数
  Future<void> resetCounter() async {
    try {
      await _localDataSource.saveCounter(CounterModel(value: 0));
    } catch (e) {
      throw Exception('重置计数失败: $e');
    }
  }
}
