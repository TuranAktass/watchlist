import 'dart:convert';
import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:watchlist_1/models/movie_for_listing.dart';
import 'package:watchlist_1/models/movie_with_details.dart';

//Additionally, in your AndroidManifest.xml file, add the Internet permission.
//<uses-permission android:name="android.permission.INTERNET" />
class OmdbManager {
  late List<MovieForListing> movieList;

  Future<List<MovieForListing>> getMoviesBySearch(String title) async {
    var url = 'http://www.omdbapi.com/?apikey=cebce6&s=$title';
    List<MovieForListing> movies = [];

    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> data = json.decode(response.body);

    List<dynamic> movieList = data['Search'];

    for (var json in movieList) {
      movies.add(MovieForListing.fromJson(json));
    }

    return movies;
  }

  Future<MovieWithDetails> getMovieWithDetails(
      String title, String year) async {
    var url = 'http://www.omdbapi.com/?apikey=cebce6&t=$title&y=$year';
    http.Response response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    var movie = data;

    return (MovieWithDetails.fromJson(movie));
  }
}
