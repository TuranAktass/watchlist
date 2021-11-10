import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/database/database_manager.dart';
import '../../viewmodel/movie_db_list/movie_db_list_view_model.dart';

class MovieDbListView extends StatelessWidget {
  final MovieDbListViewModel _viewModel = MovieDbListViewModel();

  MovieDbListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
      body: Column(
        children: [
          // ElevatedButton(
          //   child: Text('Delete all'),
          //   onPressed: () {
          //     MovieDatabase.instance.deleteAll();
          //   },
          // ),
          Expanded(
              flex: 2,
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: _viewModel.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        MovieDatabase.instance
                            .delete(_viewModel.list[index].id!);
                      },
                      child: ListTile(
                        title: Text(_viewModel.list[index].title!),
                        subtitle: Text(_viewModel.list[index].year!),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
