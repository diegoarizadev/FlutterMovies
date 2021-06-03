import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/providers/movies_provider.dart';

class MovieSearch extends SearchDelegate {
  final peliculas = [
    'Fast and furius 9',
    'chaos walking',
    'superman 8',
    'thanos',
    'viva la vida',
    'fuck cancer'
  ];
  final peliculasRecientes = ['spiderman', 'cruella'];

  String selection = '';

  final moviesProvider = MoviesProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del Apps, Ejemplo para cerrar la busqueda o limpiarla.
    return [
      IconButton(
        onPressed: () {
          query =
              ''; //la variable query, contiene lo que ha escrito el usuario en el campo
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Es el icono (Buscador o regresar) a la izquierda del AppBar
    return IconButton(
        onPressed: () {
          close(context, null); //Null hace referencia a los resultados.
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // La instruccion que crea los resultados que se van a buscar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando se esta escribiendo.

    //aplicar un filtro a un listado y la propiedad query estara mutando o cambiando.

    if (query.isEmpty) {
      //Validación para cuando los query esten vacios.
      return Container();
    } else {
      return FutureBuilder(
        future: moviesProvider.getSearchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
          if (snapshot.hasData) {
            //Tiene Data?

            final movies = snapshot.data;

            return ListView(
                children: movies!.map((movie) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(movie.getPosterImage()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: () {
                  close(context, null); //Cerrar la busqueda
                  movie.uniqueID = '';
                  //Navegar al detalle
                  Navigator.pushNamed(context, 'details', arguments: movie);
                },
              );
            }).toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }
}
