import 'package:flutter/material.dart';

class MovieSearch extends SearchDelegate {
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
    return Container();
  }
}
