import 'package:watchlist/features/movie/model/base_model.dart';

const String tableMovies = 'Movies';

class MovieFields {
  static final List<String> values = [
    id,
    title,
    year,
    released,
    runtime,
    genre,
    director,
    writer,
    actors,
    plot,
    language,
    poster,
    imdbRating,
    response,
    isWatched,
    userRating,
    userComment,
  ];

  static const String id = '_id';
  static const String title = 'Title';
  static const String year = 'Year';
  static const String released = 'Released';
  static const String runtime = 'Runtime';
  static const String genre = 'Genre';
  static const String director = 'Director';
  static const String writer = 'Writer';
  static const String actors = 'Actors';
  static const String plot = 'Plot';
  static const String language = 'Language';
  static const String poster = 'Poster';
  static const String imdbRating = 'imdbRating';
  static const String response = 'Response';
  static const String isWatched = 'IsWatched';
  static const String userRating = 'UserRating';
  static const String userComment = 'UserComment';
}

class MovieDbModel extends BaseMovieModel {
  //this data fields are fetching from omdb api

  int? id;
  String? title;
  String? year;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? poster;
  String? imdbRating;
  String? response;
  //this data fields will be filled by the user
  bool? isWatched;
  double? userRating;
  String? userComment;

  MovieDbModel({
    this.id,
    this.title,
    this.year,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.poster,
    this.imdbRating,
    this.response,
    //user
    this.isWatched,
    this.userRating,
    this.userComment,
  });

  MovieDbModel copyWith({
    int? id,
    String? title,
    String? year,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? poster,
    String? imdbRating,
    String? response,
    //user
    bool? isWatched,
    double? userRating,
    String? userComment,
  }) =>
      MovieDbModel(
        id: id ?? this.id,
        title: title ?? this.title,
        year: year ?? this.year,
        released: released ?? this.released,
        runtime: runtime ?? this.runtime,
        genre: genre ?? this.genre,
        director: director ?? this.director,
        writer: writer ?? this.writer,
        actors: actors ?? this.actors,
        plot: plot ?? this.plot,
        language: language ?? this.language,
        poster: poster ?? this.poster,
        imdbRating: imdbRating ?? this.imdbRating,
        response: response ?? this.response,
        //user
        isWatched: isWatched ?? this.isWatched,
        userRating: userRating ?? this.userRating,
        userComment: userComment ?? this.userComment,
      );

  MovieDbModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['Title'];
    year = json['Year'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    director = json['Director'];
    writer = json['Writer'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    poster = json['Poster'];
    imdbRating = json['imdbRating'];
    response = json['Response'];
    isWatched = json['IsWatched'];
    userRating = json['UserRating'];
    userComment = json['UserComment'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['Title'] = title;
    data['Year'] = year;
    data['Released'] = released;
    data['Runtime'] = runtime;
    data['Genre'] = genre;
    data['Director'] = director;
    data['Writer'] = writer;
    data['Actors'] = actors;
    data['Plot'] = plot;
    data['Language'] = language;
    data['Poster'] = poster;
    data['Response'] = response;
    data['imdbRating'] = imdbRating;
    //user
    data['isWatched'] = isWatched;
    data['userRating'] = userRating;
    data['userComment'] = userComment;
    return data;
  }
}

class Ratings {
  String? source;
  String? value;

  Ratings({required this.source, required this.value});

  Ratings.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Source'] = source;
    data['Value'] = value;
    return data;
  }
}
