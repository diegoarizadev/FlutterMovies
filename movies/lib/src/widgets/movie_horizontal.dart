import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';

class MovieHorizontal extends StatelessWidget {
  //const MovieHorizontal({Key key}) : super(key: key);

  final List<Film> movies;
  final Function nextPage;

  MovieHorizontal({required this.movies, required this.nextPage});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    //Listener
    _pageController.addListener(() {
      //Cada vez que se mueva el Scroll se ejecuta este listener.

      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        //Maximo scroll del momento.
        nextPage(); //Esta es la ejecución de la referencia de la función.
      }
    });

    return Container(
      height: _screensize.height * 0.25, //20%
      child: PageView(
        pageSnapping: false, //Magneto
        controller: _pageController,
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
