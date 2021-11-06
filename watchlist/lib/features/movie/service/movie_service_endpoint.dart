part of 'movie_service.dart';

enum _MovieServiceEndpoint { movies, movieDetailed }

extension MovieServiceEndpointsExtension on _MovieServiceEndpoint {
  String rawValue(String title, String? year) {
    switch (this) {
      case _MovieServiceEndpoint.movies:
        return 's=$title';

      case _MovieServiceEndpoint.movieDetailed:
        return 't=$title&y=$year';
    }
  }
}
