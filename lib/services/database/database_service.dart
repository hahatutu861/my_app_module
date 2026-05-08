import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Database? _database;

  DatabaseService._();

  static DatabaseService get instance => _instance ??= DatabaseService._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_app.db');

    debugPrint('=== DatabaseService._initDatabase ===');
    debugPrint('Database path: $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    debugPrint('=== DatabaseService._onCreate ===');
    debugPrint('Creating tables...');

    await db.execute('''
      CREATE TABLE floors (
        id TEXT PRIMARY KEY,
        floor_name TEXT NOT NULL,
        zone_count INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL,
        updated_at TEXT,
        rooms TEXT
      )
    ''');

    debugPrint('Tables created successfully');
  }
}
