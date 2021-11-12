import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:watchlist/core/components/navigation/nav_bar_alt.dart';
import 'package:watchlist/core/constants/color/constant_colors.dart';
import 'package:watchlist/core/constants/const_padding.dart';
import 'package:watchlist/core/constants/const_text_style.dart';
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
      bottomNavigationBar: const AltNavBar(
        routeIndex: 2,
      ),
      body: Container(
        color: backgroundDark,
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('show watched movies'),
              onPressed: () async {
                _viewModel.list =
                    await MovieDatabase.instance.readWatchedMovies();
              },
            ),
            ElevatedButton(
              child: const Text('drop db'),
              onPressed: () async {
                await MovieDatabase.instance.deleteDatabase();
              },
            ),
            const Padding(padding: padding20),
            SizedBox(
                child: Center(
                    child: Text("Watchlist",
                        style: TextStyles.h6white70(context)))),
            Expanded(
                flex: 2,
                child: Observer(
                  builder: (_) => ListView.builder(
                    itemCount: _viewModel.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        background: Container(
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                            )),
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          MovieDatabase.instance
                              .delete(_viewModel.list[index].id!);
                        },
                        child: ListTile(
                          leading:
                              Image.network(_viewModel.list[index].poster!),
                          title: Text(_viewModel.list[index].title!,
                              style: TextStyles.b1white38(context)),
                          subtitle: Text(_viewModel.list[index].year!,
                              style: TextStyles.b1white38(context)),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
