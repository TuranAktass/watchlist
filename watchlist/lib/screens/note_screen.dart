import 'package:flutter/material.dart';
import 'package:watchlist_1/database/movie_model.dart';
import 'package:watchlist_1/funcs/notes.dart';
// import 'dart:async';

class NoteScreen extends StatefulWidget {
  Movie movie;
  NoteScreen({required this.movie});

  _NoteScreenState createState() => _NoteScreenState(movieTitle: movie.title);
}

class _NoteScreenState extends State<NoteScreen> {
  String noteContent = "";

  String? movieTitle;

  _NoteScreenState({required this.movieTitle});

  @override
  void initState() {
    super.initState();
    //movieTitle = widget.movie.title;
    getContent();
  }

  getContent() async {
    var data = await NoteManager.readFromFile(movieTitle!);

    setState(() {
      noteContent = data;
    });
  }

  var myController;

  @override
  Widget build(BuildContext context) {
    //final movieTitle = widget.movie.title;
    myController = TextEditingController(text: noteContent);

    return Scaffold(
        appBar: AppBar(title: Text(movieTitle! + " Notes")),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Expanded(
                child: Card(
                    color: Colors.yellow.shade100,
                    child: TextFormField(
                        maxLines: 10,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.multiline,
                        controller: myController,
                        onSaved: (text) {
                          NoteManager.saveToFile(movieTitle!, text!);
                        })),
              ),
            ),
            Container(
              width: 400,
              height: 60,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Save'),
                  onPressed: () {
                    NoteManager.saveToFile(movieTitle!, myController.text);

                    NoteManager.readFromFile(movieTitle!).then((contents) {
                      setState(() {
                        noteContent = contents;
                      });
                    });
                  }),
            ),
          ],
        ));
  }
}
