import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';

class CardSwiperCustom extends StatelessWidget {
  //const CardSwiperCustom({Key key}) : super(key: key);

  //Lista de tarjetas o elementos a mostrar.
  final List<Film> movies;

  //Constructor
  CardSwiperCustom({required this.movies});

  @override
  Widget build(BuildContext context) {
    //Ajuste de pantallas en los diferentes dispositivos.
    //final _screenSize = MediaQuery.of(context).size;
    return CarouselSlider.builder(
        itemCount: this.movies.length,
        itemBuilder: (context, index, realIndex) => PosterImage(
              movie: this.movies[index],
            ),
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ));
    // return Container(
    //   padding: EdgeInsets.only(top: 30.0),
    //   child: Swiper(
    //     itemWidth: _screenSize.width * 0.7, //70%
    //     itemHeight: _screenSize.height * 0.5, //50%
    //     layout: SwiperLayout.STACK,
    //     itemBuilder: (BuildContext context, int index) {
    //       //construye la tarjeta

    //       movies[index].uniqueID =
    //           '${movies[index].id}-card'; //Se instancia la propiedad del modelo para generar un ID unico.

    //       return Hero(
    //         tag: movies[index].uniqueID,
    //         child: ClipRRect(
    //             borderRadius: BorderRadius.circular(20.0),
    //             child: GestureDetector(
    //               //Implementación del GestureDector en el card de las peliculas mas populares
    //               onTap: () => Navigator.pushNamed(context, 'details',
    //                   arguments: movies[index]),
    //               child: posterImage(movies: movies),
    //             )),
    //       );
    //     },
    //     itemCount: movies.length,
    //     //pagination: new SwiperPagination(),
    //     //control: new SwiperControl(),
    //   ),
    // );
  }
}

class PosterImage extends StatelessWidget {
  const PosterImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Film movie;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(movie.getPosterImage()),
      placeholder: AssetImage('assets/img/no-image.jpg'),
      fit: BoxFit.cover,
    );
  }
}
