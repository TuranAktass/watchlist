import 'package:flutter/material.dart';
import 'package:watchlist_1/database/movie_database.dart';
import 'package:watchlist_1/database/movie_model.dart';
import 'dart:ui' as ui;

import 'package:watchlist_1/screens/note_screen.dart';

class DbMovieDetailsScreen extends StatelessWidget {
  Movie? movie;
  final Color mainColor = const Color(0xff3C3261);

  DbMovieDetailsScreen(Movie movie) {
    this.movie = movie;
  }

  @override
  Widget build(BuildContext context) {
    int? movieId = movie!.id;

    return Scaffold(
        //appBar: AppBar(),
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
                        image: NetworkImage(movie!.poster), fit: BoxFit.cover),
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
              GestureDetector(
                onTap: () {
                  MoviesDatabase.instance.delete(movieId!);
                  Navigator.pop(context);
                },
                child: Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  width: 370.0,
                  height: 60.0,
                  alignment: Alignment.center,
                  child: Text('Delete',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Arvo')),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red,
                  ),
                )),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteScreen(movie: movie!)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 370.0,
                    height: 60.0,
                    alignment: Alignment.center,
                    child: Text('Add Note',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo')),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                  )),
            ],
          ),
        ))
      ],
    ));
  }
}
