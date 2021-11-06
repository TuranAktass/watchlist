import 'dart:io';

import 'package:dio/dio.dart';
import 'package:watchlist/features/movie/model/movie_model.dart';
import 'package:watchlist/features/movie/service/i_movie_service.dart';

import '../model/movie_model.dart';
import 'i_movie_service.dart';

part 'movie_service_endpoint.dart';

class MovieService extends IMovieService {
  MovieService(Dio dio) : super(dio);

  @override
  Future<List<MovieModel>> fetchMoviesBySearch(String title) async {
    final response =
        await dio.get(_MovieServiceEndpoint.movies.rawValue(title, ""));

    if (response.statusCode == HttpStatus.ok) {
      //print("response $response");
      final data = response.data['Search'];

      if (data is List) {
        //print("entered if statement");
        return data.map((e) => MovieModel.fromJson(e)).toList();
      }
    }
    return [];
  }

  @override
  Future<MovieModel> fetchMovieWithDetails(String title, String year) async {
    final response = await dio
        .get(_MovieServiceEndpoint.movieDetailed.rawValue(title, year));

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      return MovieModel.fromJson(data);
    }
    return MovieModel();
  }
}
