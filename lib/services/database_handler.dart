import 'package:first_app/models/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {

  static DatabaseHandler? _databaseHandler;
  Database? db;


  Future<Database> initializeDB() async {
    if(db != null){
      return db!;
    } else {
      String path = await getDatabasesPath();
      return openDatabase(
        join(path, 'flutter_games.db'),
        onCreate: (database, version) async {
          await database.execute(
            "CREATE TABLE games(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "external TEXT NOT NULL, "
                "internalName TEXT NOT NULL, "
                "thumb TEXT NOT NULL, "
                "gameID TEXT NOT NULL, "
                "steamAppID TEXT NOT NULL, "
                "cheapest TEXT NOT NULL, "
                "cheapestDealID TEXT NOT NULL, "
                "isSaved INTEGER NOT NULL)",
          );
        },
        version: 1,
      );
    }
  }



  Future<int> insertGame(Game game) async {
    int result = 0;
    final Database db = await initializeDB();

    result = await db.insert('games', game.toMap());

    return result;
  }

  Future<List<Game>> retrieveGames() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('games');
    debugPrint(queryResult.toString());
    return queryResult.map((e) => Game.fromMap(e)).toList();
  }

  static DatabaseHandler getInstance() {
    if(_databaseHandler != null) return _databaseHandler!;
    _databaseHandler = DatabaseHandler();
    return _databaseHandler!;
  }
}
