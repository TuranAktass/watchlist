import 'package:flutter/material.dart';
import 'package:watchlist_1/database/movie_database.dart';
import 'package:watchlist_1/database/movie_model.dart';
import 'package:watchlist_1/screens/db_movie_details.dart';
import 'package:watchlist_1/screens/listing_screen.dart';
import 'dart:async';

import 'package:watchlist_1/screens/searching_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> movies;
  bool isLoading = false;
  Movie? movie;

  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    ListingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void onTabTapped(int index) {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _children[index],
          ));
    });
  }

  Future getMovies() async {
    setState(() => isLoading = true);

    this.movies = await MoviesDatabase.instance.getAllMovies();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Container(
          margin: EdgeInsets.all(10),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : movies.isEmpty
                  ? Center(
                      child: Text('No movies found!'),
                    )
                  : Container(
                      child: Column(children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(5),
                            //margin: EdgeInsets.all(5),
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.isEmpty ? 0 : movies.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onPanUpdate: (details) {
                                    if (details.delta.dy > 0) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DbMovieDetailsScreen(
                                                      movies[index])));
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      child:
                                          Image.network(movies[index].poster)),
                                );
                              },
                            )),
                        Padding(padding: EdgeInsets.all(160)),
                      ]),
                    )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'My List')
        ],
      ),
    );
  }
}
