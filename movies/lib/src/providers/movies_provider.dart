import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movies_model.dart';

class MoviesProvider {
  String _apiKey = '';
  String _url = 'api.themoviedb.org';
  String _lenguage = 'es-ES';
  int _pageInTheaters = 0;
  int _pageGetPopulares = 0;
  bool _isLoad = false;

  List<Film> _populars = [];

  //Begin - Stream de datos.
  final _popularsStreamController = StreamController<
      List<
          Film>>.broadcast(); //Se agrega el broadcast para que muchos lugares del codigo puedan escuchar el flujo de datos.

  //Get para insertar información en el stream
  Function(List<Film>) get popularsSink => _popularsStreamController.sink.add;

  //Get para escuchar el stream
  Stream<List<Film>> get popularsStream => _popularsStreamController.stream;

  void disposeStreams() {
    //Función para cerrar los Stream!
    _popularsStreamController.close();
  }
  //End - Stream de datos.

  Future<List<Film>> getInTheaters() async {
    _pageInTheaters++;

    //Generacion de la URL HTTPS
    final _uriS = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _lenguage,
      'page': _pageInTheaters.toString(),
    });
    return await _processResponse(_uriS);
  }

  Future<List<Film>> getPopulars() async {
    if (_isLoad) return [];
    _isLoad = true;

    _pageGetPopulares++; //Se aumenta la paginación.

    //Generacion de la URL HTTPS
    final _uriS = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _lenguage,
      'page': _pageGetPopulares.toString(),
    });

    //Begin - Stream de datos
    final response = await _processResponse(_uriS);

    _populars.addAll(
        response); //addAll es de tipo iterable, por lo tanto todas las peliculas que viajen en el response seran agregadas.

    popularsSink(_populars); //Colocarlo al inicio de Stream de datos.
    //End - Stream de datos
    _isLoad = false;
    return response;
  }

  Future<List<Film>> _processResponse(Uri url) async {
    //Peticion HTTP al servicio.
    final response = await http.get(url);
    final decodeData = json.decode(response.body);

    // print('Populares : ${decodeData['results']}'); //Imprime en consola la repuesta del servicio.

    final movies = Movies.fromJsonList(decodeData[
        'results']); //El constructor va a barrer todos las peliculas que viene de la repuesta del servicio, para crear instancias o items segun el modelo

    // print('Popularess : ${movies.items[2].title}'); //Imprime una pelicula en puntual
    return movies.items;
  }
}
