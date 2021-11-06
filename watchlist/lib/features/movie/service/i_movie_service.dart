import 'package:dio/dio.dart';

import '../model/movie_model.dart';

abstract class IMovieService {
  final Dio dio;

  IMovieService(this.dio);

  Future<List<MovieModel>> fetchMoviesBySearch(String title);

  Future<MovieModel> fetchMovieWithDetails(String title, String year);
}
