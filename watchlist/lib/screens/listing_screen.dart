import 'package:flutter/material.dart';
import 'package:watchlist_1/database/movie_database.dart';
import 'package:watchlist_1/database/movie_model.dart';
import 'package:watchlist_1/screens/db_movie_details.dart';
import 'package:watchlist_1/screens/main_screen.dart';
import 'package:watchlist_1/screens/searching_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  late List<Movie> movies;
  bool isLoading = false;
  bool isDeleted = false;
  int? _selected;

  //int _currentIndex = 0; !! unused field

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
        ),
      );
    });
  }
/*
  @override
  void dispose() {
    MoviesDatabase.instance.close();

    super.dispose();
  }

  */

  Future getMovies() async {
    setState(() => isLoading = true);

    this.movies = await MoviesDatabase.instance.getAllMovies();

    setState(() => isLoading = false);
  }

  Future deleteMovie(id) async {
    setState(() => isDeleted = false);

    await MoviesDatabase.instance.delete(id);

    setState(() => isDeleted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 3, color: Colors.white))),
              width: 400,
              height: 70,
              child: Text('My List',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aleo(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40.0))),
          Expanded(
            child: isLoading
                ? CircularProgressIndicator()
                : movies.isEmpty
                    ? Center(
                        child: Text("No movies"),
                      )
                    : ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              onDismissed: (direction) {
                                setState(() => _selected = movies[index].id!);
                                deleteMovie(_selected);
                                getMovies();
                              },
                              background: Container(color: Colors.white),
                              secondaryBackground: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.delete))),
                              key: UniqueKey(),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              // instead of DbMovieDetailsScreen(movies[index]),
                                              DbMovieDetailsScreen(
                                                  movies[index]),
                                        ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 1),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    child: ListTile(
                                      leading: movies[index].poster == "N/A"
                                          ? Icon(Icons.no_cell)
                                          : Image.network(movies[index].poster),
                                      title: Text(movies[index].title +
                                          '  (' +
                                          movies[index].year +
                                          ')'),
                                      subtitle: Text(movies[index].director),
                                    ),
                                  )));
                        }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'My List')
        ],
      ),
    );
  }
}
