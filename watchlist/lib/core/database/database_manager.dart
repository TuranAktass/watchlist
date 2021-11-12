import 'package:watchlist/features/movie/model/movie_db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MovieDatabase {
  static final MovieDatabase instance = MovieDatabase._init();
  static Database? _database;

  MovieDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase('watchlist.db');
    return _database!;
  }

  Future<Database> _initDatabase(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    return await openDatabase(path, version: 5, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    return db.execute(
      '''CREATE TABLE $tableMovies(
        ${MovieFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${MovieFields.title} TEXT,
        ${MovieFields.year} TEXT,
        ${MovieFields.released} TEXT,
        ${MovieFields.runtime} TEXT,
        ${MovieFields.genre} TEXT,
        ${MovieFields.director} TEXT,
        ${MovieFields.writer} TEXT, 
        ${MovieFields.actors} TEXT, 
        ${MovieFields.plot} TEXT,
        ${MovieFields.language} TEXT,
        ${MovieFields.poster} TEXT,
        ${MovieFields.imdbRating} TEXT,
        ${MovieFields.response} TEXT,
        ${MovieFields.isWatched} TEXT,
        ${MovieFields.userRating} TEXT,
        ${MovieFields.userComment} TEXT
        )''',
    );
  }

  Future close() async {
    final db = await database;
    return db.close();
  }

  Future<MovieDbModel> create(MovieDbModel movie) async {
    final db = await database;
    final id = await db.insert(tableMovies, movie.toJson());
    return movie.copyWith(id: id);
  }

  Future<MovieDbModel> readMovie(int id) async {
    final db = await database;
    final result = await db.query(tableMovies,
        columns: MovieFields.values,
        where: '${MovieFields.id} = ?',
        whereArgs: [id]);
    if (result.isNotEmpty) {
      return MovieDbModel.fromJson(result.first);
    } else {
      throw Exception('ID $id not found!');
    }
  }

  Future<List<MovieDbModel>> readAllMovies() async {
    final db = await instance.database;

    const orderBy = '${MovieFields.id} DESC';

    final result = await db.query(tableMovies, orderBy: orderBy);
    return result.map((json) => MovieDbModel.fromJson(json)).toList();
  }

  Future<void> setWatched(MovieDbModel movie) async {
    final db = await database;
    await db.rawQuery(
        'UPDATE $tableMovies SET ${MovieFields.isWatched}=true WHERE ${MovieFields.id}=${movie.id}');
  }

  Future<List<MovieDbModel>> readWatchedMovies() async {
    final db = await instance.database;

    const orderBy = '${MovieFields.id} DESC';

    final result = await db.query(tableMovies,
        where: '${MovieFields.isWatched}=1', orderBy: orderBy);

    return result.map((json) => MovieDbModel.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db
        .delete(tableMovies, where: '${MovieFields.id} = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete(tableMovies);
  }

  Future<int> deleteDatabase() async {
    final db = await database;
    return await db.delete(tableMovies);
  }
}
