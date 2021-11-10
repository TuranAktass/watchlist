import "package:flutter/material.dart";

import '../../../../../../core/constants/const_text_style.dart';
import '../../../../../../core/database/database_manager.dart';
import '../../../../model/movie_db_model.dart';
import '../../movie_details_view.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.widget,
    required this.size,
  }) : super(key: key);

  final MovieDetailsView widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MovieDatabase.instance
            .create(MovieDbModel.fromJson(widget.model!.toJson()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Saved'),
        ));
      },
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.10,
        child:
            Center(child: Text('Save', style: TextStyles.b1white70(context))),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
