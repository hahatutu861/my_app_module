import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:my_app_module/models/floor_model.dart';
import 'package:my_app_module/models/room_model.dart';
import 'package:my_app_module/services/database/database_service.dart';
import 'package:my_app_module/providers/app_runtime_config.dart';

final floorRepositoryProvider = Provider<FloorRepository>((ref) {
return FloorRepository(ref);
});

class FloorRepository {
  static const String _table = 'floors';
  final Ref _ref;

  FloorRepository(this._ref);

  Future<Database> get _database async {
    return DatabaseService.instance.database;
  }

  Future<FloorModel> createFloor(String floorName) async {
    final db = await _database;
    String? deviceId;
    try {
      deviceId = _ref.read(deviceIdProvider);
    } catch (e) {
      // deviceId 获取失败时使用 null
    }
    final floor = FloorModel(
      id: const Uuid().v4(),
      floorName: floorName,
      zoneCount: 0,
      createdAt: DateTime.now(),
      deviceId: deviceId,
    );

    try {
      await db.insert(_table, _toDbMap(floor));
    } catch (e) {
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

  Future<List<FloorModel>> getAllFloors() async {
    final db = await _database;
    String? deviceId;
    try {
      deviceId = _ref.read(deviceIdProvider);
    } catch (e) {
      // deviceId 获取失败时使用 null
    }
    final results = await db.query(
      _table,
      where: 'device_id = ?',
      whereArgs: [deviceId],
      orderBy: 'created_at DESC',
    );
    if (results.isEmpty) return [];
    return results.map((map) => _fromDbMap(map)).toList();
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

  Future<FloorModel?> updateRooms(String id, List<RoomModel> rooms) async {
    final db = await _database;
    final existing = await db.query(_table, where: 'id = ?', whereArgs: [id]);
    if (existing.isEmpty) return null;

    final floor = _fromDbMap(existing.first);
    final updated = floor.copyWith(
      rooms: rooms,
      updatedAt: DateTime.now(),
    );
    await db.update(_table, _toDbMap(updated), where: 'id = ?', whereArgs: [id]);
    return updated;
  }

  Future<void> deleteFloor(String id) async {
    final db = await _database;
    await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }

  Map<String, dynamic> _toDbMap(FloorModel floor) => {
        'id': floor.id,
        'floor_name': floor.floorName,
        'zone_count': floor.zoneCount,
        'created_at': floor.createdAt.toIso8601String(),
        'updated_at': floor.updatedAt?.toIso8601String(),
        'rooms': jsonEncode(floor.rooms.map((r) => r.toJson()).toList()),
        'device_id': floor.deviceId,
      };

  FloorModel _fromDbMap(Map<String, dynamic> map) => FloorModel(
        id: map['id'] as String,
        floorName: map['floor_name'] as String,
        zoneCount: map['zone_count'] as int,
        createdAt: DateTime.parse(map['created_at'] as String),
        updatedAt: map['updated_at'] != null
            ? DateTime.parse(map['updated_at'] as String)
            : null,
        rooms: map['rooms'] != null && (map['rooms'] as String).isNotEmpty
            ? (jsonDecode(map['rooms'] as String) as List)
                .map((r) => RoomModel.fromJson(r as Map<String, dynamic>))
                .toList()
            : [],
        deviceId: map['device_id'] as String?,
      );
}
