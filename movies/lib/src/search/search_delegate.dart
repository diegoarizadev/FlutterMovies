import 'package:flutter/material.dart';

class MovieSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del Apps, Ejemplo para cerrar la busqueda o limpiarla.
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Es el icono (Buscador o regresar) a la izquierda del AppBar
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // La instruccion que crea los resultados que se van a buscar
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando se esta escribiendo.
    throw UnimplementedError();
  }
}
