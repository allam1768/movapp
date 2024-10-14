import 'package:get/get.dart';
import 'package:movie_app/models/MovieModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskController extends GetxController {
  static Database? _db;

  // List observable untuk semua movie dan favorit
  var tasks = <Taskmodel>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT,
            posterPath TEXT, 
            imdb TEXT
          )
        ''');
      },
    );
  }

  Future<int> addTask(Taskmodel task) async {
    var dbClient = await db;
    // Ubah nama tabel dari 'tasks' menjadi 'movies' sesuai dengan tabel yang dibuat
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks(); // Refresh list tasks
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    // Query ke tabel 'movies', bukan 'tasks'
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(queryResult.map((data) => Taskmodel.fromMap(data)).toList());
  }

  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    // Hapus dari tabel 'movies', bukan 'tasks'
    await dbClient!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }
}
