import 'package:flutter1_b3_2026/tugas/tugas_12/model/login_user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fodos.db');

    return await openDatabase(
      path,
      version: 1,

      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT UNIQUE,
            nomorhp TEXT,
            email TEXT UNIQUE,
            password TEXT,
            alamat TEXT
          )
        ''');
      },
    );
  }

  Future<bool> registerUser(UserModelLoginSQL pengguna) async {
    final db = await database;

    try {
      await db.insert('users', pengguna.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModelLoginSQL?> loginUser(String email, String password) async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return UserModelLoginSQL.fromMap(results.first);
    }
    return null;
  }

  Future<List<UserModelLoginSQL>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query('users');
    return results.map((map) => UserModelLoginSQL.fromMap(map)).toList();
  }

  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> updateUser(UserModelLoginSQL pengguna) async {
    final db = await database;

    try {
      int count = await db.update(
        'users',
        pengguna.toMap(),
        where: 'id = ?',
        whereArgs: [pengguna.id],
      );
      return count > 0;
    } catch (e) {
      return false;
    }
  }

  Future<UserModelLoginSQL?> getUserById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return UserModelLoginSQL.fromMap(results.first);
    }
    return null;
  }

  Future<UserModelLoginSQL?> getUserByEmail(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (results.isNotEmpty) {
      return UserModelLoginSQL.fromMap(results.first);
    }
    return null;
  }
}
