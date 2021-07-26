import 'package:flutter/material.dart';
import 'package:watchlist_1/database/movie_database.dart';
import 'package:watchlist_1/database/movie_model.dart';
import 'package:watchlist_1/screens/listing_screen.dart';
import 'package:watchlist_1/screens/main_screen.dart';
import 'package:watchlist_1/screens/movie_details_screen.dart';
import 'package:watchlist_1/models/movie_for_listing.dart';
import 'package:watchlist_1/omdb/omdb_manager.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  OmdbManager omdbManager = OmdbManager();
  final textController = TextEditingController();
  late Future<List<MovieForListing>> movies;
  String? _searchItem = " ";

  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    ListingScreen(),
  ];

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

  Future saveMovie(movie) async {
    final mov = Movie(
      title: movie!.getTitle(),
      poster: movie!.getPoster(),
      year: movie!.getYear(),
      director: movie!.getDirector(),
      plot: movie!.getPlot(),
      genre: movie!.getGenre(),
      actors: movie!.getActors(),
    );

    await MoviesDatabase.instance.create(mov);
  }

  @override
  Widget build(BuildContext context) {
    //_getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Padding(padding: EdgeInsets.all(3.0)),
        TextFormField(
          onChanged: (text) {
            setState(() {
              _searchItem = text;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.arrow_forward),
            suffixIcon: Icon(Icons.search),
            labelText: 'Movie Title',
            hintText: 'Enter a movie name',
            fillColor: Colors.white,
            border: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(25.0),
                ),
          ),
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        //const Padding(padding: EdgeInsets.all(20.0)),
        Expanded(
            child: FutureBuilder<List<MovieForListing>>(
                future: omdbManager.getMoviesBySearch(_searchItem!),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('No results found'));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        padding: EdgeInsets.all(1),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return Dismissible(
                            key: UniqueKey(),
                            background: Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                color: Colors.green.shade100,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(Icons.add))),
                            onDismissed: (direction) async {
                              final selectedMovie =
                                  await omdbManager.getMovieWithDetails(
                                      item.getTitle(), item.getYear());
                              saveMovie(selectedMovie);
                            },
                            child: ListTile(
                                leading: item.getPoster() == "N/A"
                                    ? Icon(Icons.no_cell)
                                    : Image.network(item.getPoster()),
                                title: Text(item.getTitle()),
                                subtitle: Text(item.getYear()),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsScreen(item),
                                    ),
                                  );
                                }),
                          );
                        }
                        //itemBuilder: (context, index) {
                        //  return MovieCell(snapshot.data![index]);
                        );
                  } else {
                    return CircularProgressIndicator();
                  }
                }))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'My List')
        ],
      ),
    );
  }
}
