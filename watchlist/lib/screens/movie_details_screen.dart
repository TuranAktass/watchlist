import 'package:flutter/material.dart';
import 'package:watchlist_1/database/movie_database.dart';
import 'package:watchlist_1/database/movie_model.dart';
import 'package:watchlist_1/models/movie_for_listing.dart';
import 'package:watchlist_1/omdb/omdb_manager.dart';
import 'dart:ui' as ui;

class MovieDetailsScreen extends StatefulWidget {
  var _movie;

  MovieDetailsScreen(MovieForListing movie) {
    _movie = movie;
  }

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetailsScreen> {
  OmdbManager omdbManager = OmdbManager();
  var movie;
  var response;

  void getData() async {
    response = await omdbManager.getMovieWithDetails(
        widget._movie!.title, widget._movie!.year);

    setState(() {
      movie = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return movie == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(title: Text("My List")),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(movie!.poster, fit: BoxFit.cover),
                BackdropFilter(
                    filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(color: Colors.black.withOpacity(0.5))),
                SingleChildScrollView(
                    child: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Container(width: 400.0, height: 400.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(movie!.poster),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                  offset: Offset(0.0, 10.0))
                            ]),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 0.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(movie!.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 26.0,
                                          fontFamily: 'Arvo'))),
                              Text(movie!.year,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arvo'))
                            ],
                          )),
                      Text(movie!.genre,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Arvo',
                              fontSize: 16.0)),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Text(movie!.director,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Arvo',
                              fontSize: 16.0)),
                      Padding(padding: EdgeInsets.all(10.0)),
                      Container(
                        child: Text(movie!.plot,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Arvo',
                                fontSize: 16.0)),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 0.0))
                            ]),
                      ),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Text(movie!.actors,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Arvo',
                              fontSize: 16.0)),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                          width: 400,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                MoviesDatabase.instance.create(Movie(
                                  title: movie!.title,
                                  poster: movie!.poster,
                                  year: movie!.year,
                                  director: movie!.director,
                                  actors: movie!.actors,
                                  genre: movie!.genre,
                                  plot: movie!.plot,
                                ));
                              },
                              child: Text('Add to List',
                                  style: TextStyle(
                                      fontFamily: 'Arvo', fontSize: 20.0)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green)))
                    ],
                  ),
                ))
              ],
            ));
  }

  Future saveMovie() async {
    final mov = Movie(
      title: movie!.title,
      poster: movie!.poster,
      year: movie!.year,
      director: movie!.director,
      plot: movie!.plot,
      genre: movie!.genre,
      actors: movie!.actors,
    );

    await MoviesDatabase.instance.create(mov);
  }
}
