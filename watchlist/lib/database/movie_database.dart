import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:watchlist_1/database/movie_model.dart';

class MoviesDatabase {
  static final MoviesDatabase instance = MoviesDatabase._init();
  static Database? _database;

  MoviesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('movies.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableMovies(
        ${MovieFields.id} $idType,
        ${MovieFields.poster} $textType,
        ${MovieFields.title} $textType,
        ${MovieFields.year} $textType,
        ${MovieFields.genre} $textType,
        ${MovieFields.director} $textType,
        ${MovieFields.plot} $textType,
        ${MovieFields.actors} $textType
         )
    ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Future<Movie> create(Movie movie) async {
    final db = await instance.database;
    final id = await db.insert(tableMovies, movie.toJson());

    return movie.copy(id: id);
  }

  Future<Movie> getMovie(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableMovies,
        columns: MovieFields.values,
        where: '${MovieFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Movie.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found!');
    }
  }

  Future<List<Movie>> getAllMovies() async {
    final db = await instance.database;

    //final orderBy = '${MovieFields.id} ASC';

    final result = await db.query(tableMovies);
    return result.map((json) => Movie.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db
        .delete(tableMovies, where: '${MovieFields.id} =?', whereArgs: [id]);
  }
}
