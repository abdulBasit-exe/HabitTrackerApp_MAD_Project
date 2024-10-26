// db/database_providers.dart

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:simple_habits/models/habit.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  static Database? _database;

  // Factory constructor to return the same instance
  factory DatabaseProvider() {
    return _instance;
  }

  // Private constructor
  DatabaseProvider._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'habits.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE habits(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, time TEXT, days TEXT, goal INTEGER, progress INTEGER, isDone INTEGER, reminders INTEGER)',
        );
      },
    );
  }

  Future<List<Habit>> getHabits({bool uncheck = false, bool resetProgress = false}) async {
    final db = await database; // Access database here
    final List<Map<String, dynamic>> maps = await db.query('habits');
    
    if (resetProgress) {
      for (var habit in maps) {
        habit['progress'] = 0; // Reset progress
        await db.update('habits', habit, where: 'id = ?', whereArgs: [habit['id']]);
      }
    }

    return List.generate(maps.length, (i) {
      return Habit.fromMap(maps[i]);
    });
  }

  Future<void> insert(Habit habit) async {
    final db = await database; // Access database here
    await db.insert('habits', habit.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(Habit habit) async {
    final db = await database; // Access database here
    await db.update('habits', habit.toMap(), where: 'id = ?', whereArgs: [habit.id]);
  }

  Future<void> delete(int id) async {
    final db = await database; // Access database here
    await db.delete('habits', where: 'id = ?', whereArgs: [id]);
  }
}
