import 'package:flutter/material.dart';

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
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blue,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando se esta escribiendo.

    //aplicar un filtro a un listado y la propiedad query estara mutando o cambiando.

    final listaSugerida = (query.isEmpty)
        ? peliculasRecientes
        : peliculas
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList(); //Retonar todos los resultados segun la busqueda.

    return ListView.builder(
        itemCount: listaSugerida.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaSugerida[i]),
            onTap: () {
              selection = listaSugerida[i];
              showResults(context); //Muestra los resultados
            },
          );
        });
  }
}
