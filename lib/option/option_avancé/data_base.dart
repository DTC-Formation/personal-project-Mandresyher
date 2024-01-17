import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'your_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE jokes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        setup TEXT,
        delivery TEXT
      )
    ''');
  }

  Future<int> insertJoke(Map<String, dynamic> joke) async {
    Database db = await instance.database;
    return await db.insert('jokes', joke);
  }

  Future<List<Map<String, dynamic>>> getJokes() async {
    Database db = await instance.database;
    return await db.query('jokes');
  }
}
