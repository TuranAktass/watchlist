/*import 'package:flutter/material.dart';
import 'package:watchlist_1/models/movie_for_listing.dart';
import 'package:watchlist_1/screens/movie_details_screen.dart';

class MovieCell extends StatelessWidget {
  String? _poster;
  String? _title;
  String? _year;
  MovieForListing? _movie;

  MovieCell(MovieForListing movie) {
    _movie = movie;
    _title = movie.getTitle();
    _poster = movie.getPoster();
    _year = movie.getYear();
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MovieDetailsScreen(_movie!),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        /*   () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(_movie!),
            ),
          );
        },*/
        child: Container(
            /*decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(25),
            ),*/
            margin: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            width: 80,
            height: 160,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    _poster!.isEmpty
                        ? Icon(Icons.no_cell, size: 60)
                        : Image.network(_poster!, width: 60, height: 120),
                    Text(_title!),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(_year!),
                  ],
                )
              ],
            )));
  }
}
*/