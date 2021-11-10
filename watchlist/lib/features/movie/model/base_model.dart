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

  BaseMovieModel();

  Map<String, dynamic> toJson();
  BaseMovieModel.fromJson();
}
