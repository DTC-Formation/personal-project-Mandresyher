import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String jokeTable = 'jokes';
final String commentTable = 'comments';
final String favoriteTable = 'favorites';
final String userJokesTable = 'userJokes';

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
    Database db = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await _createDb(db, version);
      },
    );
    return db;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $jokeTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      setup TEXT,
      delivery TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE $commentTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      author TEXT,
      content TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE $favoriteTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      item_id INTEGER,
      type TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE $userJokesTable (
      id TEXT PRIMARY KEY,
      username TEXT,
      joke TEXT
    )
  ''');
  }

  // Methods for jokes
  Future<int> insertJoke(Map<String, dynamic> joke) async {
    Database db = await instance.database;
    return await db.insert(jokeTable, joke);
  }

  Future<List<Map<String, dynamic>>> getJokes() async {
    Database db = await instance.database;
    return await db.query(jokeTable);
  }

  // Methods for comments
  Future<int> insertComment(Map<String, dynamic> comment) async {
    Database db = await instance.database;
    return await db.insert(commentTable, comment);
  }

  Future<void> deleteComment(String commentId) async {
    Database db = await instance.database;
    await db.delete(commentTable, where: 'id = ?', whereArgs: [commentId]);
  }

  Future<List<Map<String, dynamic>>> getComments() async {
    Database db = await instance.database;
    return await db.query(commentTable);
  }

  Future<int> insertFavorite(Map<String, dynamic> favorite) async {
    Database db = await instance.database;
    return await db.insert(favoriteTable, favorite);
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    Database db = await instance.database;
    return await db.query(favoriteTable);
  }

  Future<int> insertUserJoke(Map<String, dynamic> userJoke) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('userJokes', userJoke);
  }

  Future<List<Map<String, dynamic>>> getuserJoke() async {
    Database db = await instance.database;
    return await db.query(userJokesTable);
  }

  Future<void> deleteuserJoke(String userJokesId) async {
    Database db = await instance.database;
    await db.delete(userJokesTable, where: 'id = ?', whereArgs: [userJokesId]);
  }
}
