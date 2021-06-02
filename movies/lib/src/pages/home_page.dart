import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key home}) : super(key: key);

  final MoviesProvider moviesProvider = new MoviesProvider();

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_swiperCards(), _footer(context)],
        ),
      ),
    );
  }

  _swiperCards() {
    MoviesProvider moviesProvider = new MoviesProvider();
    return FutureBuilder(
      future: moviesProvider.getInTheaters(),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiperCustom(movies: snapshot.data!);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  _footer(BuildContext context) {
    MoviesProvider moviesProvider = new MoviesProvider();

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Populares',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          FutureBuilder(
            future: moviesProvider.getPopulars(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
