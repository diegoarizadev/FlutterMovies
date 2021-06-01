import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key home}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [_swiperCards()],
        ),
      ),
    );
  }

  _swiperCards() {
    final MoviesProvider moviesProvider = new MoviesProvider();
    moviesProvider.getInTheaters();

    return CardSwiperCustom(
      movies: [1, 2, 3, 4, 5],
    );
  }
}
