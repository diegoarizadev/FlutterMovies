import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';

class MovieHorizontal extends StatelessWidget {
  //const MovieHorizontal({Key key}) : super(key: key);

  final List<Film> movies;

  MovieHorizontal({required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    return Container(
      height: _screensize.height * 0.25, //20%
      child: PageView(
        pageSnapping: false, //Magneto
        controller: PageController(
            initialPage: 1, viewportFraction: 0.3 //Cantidad de elementos.
            ),
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards(BuildContext context) {
    return movies.map((film) {
      return Container(
        margin: EdgeInsets.only(right: 15.0), //Separacion entre las tarjetas
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover, //Todo el ancho posible
                  height: 160.0,
                  image: NetworkImage(film.getPosterImage())),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              film.title,
              overflow: TextOverflow
                  .ellipsis, //Coloca 3 puntos, cuando el texto no cabe.
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
