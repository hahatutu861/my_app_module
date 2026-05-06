import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/services/database/database_service.dart';

final floorRepositoryProvider = Provider<FloorRepository>((ref) {
  debugPrint('=== floorRepositoryProvider ===');
  return FloorRepository();
});

class FloorRepository {
  static const String _table = 'floors';
  Future<Database> get _database async {
    return DatabaseService.instance.database;
  }

  Future<FloorModel> createFloor(String floorName) async {
    debugPrint('=== FloorRepository.createFloor ===');
    debugPrint('floorName: $floorName');

    final db = await _database;
    debugPrint('Database ready: ${db.path}');

    final floor = FloorModel(
      id: const Uuid().v4(),
      floorName: floorName,
      zoneCount: 0,
      createdAt: DateTime.now(),
    );

    debugPrint('FloorModel created: ${floor.toJson()}');

    try {
      final result = await db.insert(_table, _toDbMap(floor));
      debugPrint('Insert result (row id): $result');
      debugPrint('Insert successful!');
    } catch (e, stackTrace) {
      debugPrint('Insert failed: $e');
      debugPrint('StackTrace: $stackTrace');
      rethrow;
    }

    return floor;
  }

  Future<FloorModel?> getActiveFloor() async {
    final db = await _database;
    final results = await db.query(
      _table,
      orderBy: 'created_at DESC',
      limit: 1,
    );
    if (results.isEmpty) return null;
    return _fromDbMap(results.first);
  }

  Future<FloorModel?> getFloorById(String id) async {
    final db = await _database;
    final results = await db.query(
      _table,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (results.isEmpty) return null;
    return _fromDbMap(results.first);
  }

  Future<FloorModel?> updateFloorName(String id, String newName) async {
    final db = await _database;
    final existing = await db.query(_table, where: 'id = ?', whereArgs: [id]);
    if (existing.isEmpty) return null;

    final floor = _fromDbMap(existing.first);
    final updated = floor.copyWith(
      floorName: newName,
      updatedAt: DateTime.now(),
    );
    await db.update(_table, _toDbMap(updated), where: 'id = ?', whereArgs: [id]);
    return updated;
  }

  Future<FloorModel?> updateZoneCount(String id, int count) async {
    final db = await _database;
    final existing = await db.query(_table, where: 'id = ?', whereArgs: [id]);
    if (existing.isEmpty) return null;

    final floor = _fromDbMap(existing.first);
    final updated = floor.copyWith(
      zoneCount: count,
      updatedAt: DateTime.now(),
    );
    await db.update(_table, _toDbMap(updated), where: 'id = ?', whereArgs: [id]);
    return updated;
  }

  Map<String, dynamic> _toDbMap(FloorModel floor) => {
        'id': floor.id,
        'floor_name': floor.floorName,
        'zone_count': floor.zoneCount,
        'created_at': floor.createdAt.toIso8601String(),
        'updated_at': floor.updatedAt?.toIso8601String(),
      };

  FloorModel _fromDbMap(Map<String, dynamic> map) => FloorModel(
        id: map['id'] as String,
        floorName: map['floor_name'] as String,
        zoneCount: map['zone_count'] as int,
        createdAt: DateTime.parse(map['created_at'] as String),
        updatedAt: map['updated_at'] != null
            ? DateTime.parse(map['updated_at'] as String)
            : null,
      );
}
