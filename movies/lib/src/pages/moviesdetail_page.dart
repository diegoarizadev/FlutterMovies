import 'package:flutter/material.dart';
import 'package:movies/src/models/actors_model.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/providers/movies_provider.dart';

class MovieDetails extends StatelessWidget {
  //MovieDetails({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final Film film = ModalRoute.of(context)!.settings.arguments as Film;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _createAppBar(film),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _posterTitle(film, context),
            _description(film),
            _createCast(film),
          ]),
        ), //objetos normales o standar
      ],
    ));
  }

  _createAppBar(Film film) {
    return SliverAppBar(
        elevation: 2.0,
        expandedHeight: 200.0, //Ancho total de la expansión
        backgroundColor: Colors.orange,
        floating: false,
        pinned: true, //Para que se mantenga visible, mientras se hace scroll
        flexibleSpace: FlexibleSpaceBar(
          //el widget se debe adaptar en el espacio de AppBar
          centerTitle: true,
          title: Text(
            film.title.toString(),
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          background: Hero(
            tag: film.uniqueIdBanner,
            child: FadeInImage(
              image: NetworkImage(film.getBackgroundImage()),
              placeholder: AssetImage('assets/img/loading.gif'),
              fit: BoxFit.cover, //Todo el ancho posible
              fadeInDuration: Duration(milliseconds: 20),
            ),
          ),
        ));
  }

  _posterTitle(Film film, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
              tag: film.uniqueId, //ID
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: NetworkImage(film.getPosterImage()),
                  height: 150,
                ),
              )),
          SizedBox(width: 20.0),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(film.title.toString(),
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis),
              Text(film.originalTitle.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star_border),
                  Text(film.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subtitle1)
                ],
              ) //TextOverflow.ellipsis coloca los 3 puntos.
            ],
          ))
        ],
      ),
    );
  }

  _description(Film film) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        film.overview.toString(),
        textAlign: TextAlign.justify,
      ),
    );
  }

  _createCast(Film? film) {
    final movieProvider = new MoviesProvider();

    return FutureBuilder(
      future: movieProvider.getCast(film!.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if (snapshot.hasData) {
          return _createActorsPageView(snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _createActorsPageView(List<Actor>? actor) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //pageSnapping: false, //Para mantener el momentun del scroll
        controller: PageController(
          viewportFraction: 0.3,
        ),
        itemCount: actor!.length,
        itemBuilder: (context, i) => _actorCard(actor[i]),
      ),
    );
  }

  _actorCard(Actor actor) {
    return Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(actor.getPhoto()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover, //Todo el ancho posible
                fadeInDuration: Duration(milliseconds: 20),
                height: 150.0,
              ),
            ),
            Container(
              width: 120,
              child: Text(
                actor.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }
}
