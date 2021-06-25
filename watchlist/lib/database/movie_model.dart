final String tableMovies = 'movies';

class MovieFields {
  static final List<String> values = [
    id,
    title,
    poster,
    year,
    director,
    genre,
    plot,
    actors,
  ];

  static final String id = "_id";
  static final String title = "Title";
  static final String poster = "Poster";
  static final String year = "Year";
  static final String director = "Director";
  static final String genre = "Genre";
  static final String plot = "Plot";
  static final String actors = "Actors";
}

class Movie {
  final int? id;
  final String title;
  final String poster;
  final String year;
  final String director;
  final String genre;
  final String plot;
  final String actors;

  const Movie({
    this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.director,
    required this.genre,
    required this.plot,
    required this.actors,
  });

  Movie copy({
    int? id,
    String? title,
    String? poster,
    String? year,
    String? director,
    String? genre,
    String? plot,
    String? actors,
  }) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        poster: poster ?? this.poster,
        year: year ?? this.year,
        director: director ?? this.director,
        genre: genre ?? this.genre,
        plot: plot ?? this.plot,
        actors: actors ?? this.actors,
      );

  static Movie fromJson(Map<String, Object?> json) => Movie(
        id: json[MovieFields.id] as int?,
        title: json[MovieFields.title] as String,
        poster: json[MovieFields.poster] as String,
        year: json[MovieFields.year] as String,
        genre: json[MovieFields.genre] as String,
        director: json[MovieFields.director] as String,
        plot: json[MovieFields.plot] as String,
        actors: json[MovieFields.actors] as String,
      );

  Map<String, Object?> toJson() => {
        MovieFields.id: id,
        MovieFields.title: title,
        MovieFields.poster: poster,
        MovieFields.year: year,
        MovieFields.director: director,
        MovieFields.genre: genre,
        MovieFields.plot: plot,
        MovieFields.actors: actors,
      };
}
