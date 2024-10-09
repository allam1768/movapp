import 'package:get/get.dart';
import 'package:movie_app/models/MovieModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MovieController extends GetxController {
  static Database? _db;

  // List observable untuk semua movie dan favorit
  var tasks = <Moviemodel>[].obs;
  var favoriteTasks = <Moviemodel>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'movie_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE movies(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT, 
            posterPath TEXT, 
            imdb TEXT
          )
        ''');
      },
    );
  }

  Future<int> addTask(Moviemodel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('movies', task.toMap());
    loadTasks(); // Refresh list tasks
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('movies');
    tasks.assignAll(queryResult.map((data) => Moviemodel.fromMap(data)).toList());
  }

  Future<void> loadFavoriteTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('movies');
    favoriteTasks.assignAll(queryResult.map((data) => Moviemodel.fromMap(data)).toList());
  }

  Future<void> deleteTask(int id)async {
    var dbClient = await db;
    await dbClient!.delete('tasks',where: 'id = ?', whereArgs: [id] );
    loadTasks();
  }
}
