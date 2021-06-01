import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiperCustom extends StatelessWidget {
  //const CardSwiperCustom({Key key}) : super(key: key);

  //Lista de tarjetas o elementos a mostrar.
  final List<dynamic> movies;

  //Constructor
  CardSwiperCustom({required this.movies});

  @override
  Widget build(BuildContext context) {
    //Ajuste de pantallas en los diferentes dispositivos.
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.7, //70%
        itemHeight: _screenSize.height * 0.5, //50%
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              "https://dummyimage.com/600x400/000/fff",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: movies.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
