abstract class BaseMovieModel {
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

  BaseMovieModel.withFields({
    required this.id,
    required this.title,
    required this.year,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.poster,
    required this.imdbRating,
    required this.response,
    required this.isWatched,
    required this.userRating,
    required this.userComment,
  });

  BaseMovieModel();
  Map<String, dynamic> toJson();
  BaseMovieModel.fromJson();
}
