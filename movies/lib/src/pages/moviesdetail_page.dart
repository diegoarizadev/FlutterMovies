import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';

class MovieDetails extends StatelessWidget {
  //MovieDetails({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final Film? film = ModalRoute.of(context)!.settings.arguments as Film?;

    return Scaffold(
      body: Center(
        child: Text(film!.title),
      ),
    );
  }
}
