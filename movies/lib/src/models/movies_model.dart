class Movies {
  List<Film> items = new List<Film>.empty(growable: true);

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;

    for (var item in jsonList) {
      final film = new Film.fromJsonMap(item);
      items.add(film);
    }
  }
}

class Film {
  bool adult = false;
  String backdropPath = '';
  List<int> genreIds = [];
  int id = 0;
  String originalLanguage = '';
  String originalTitle = '';
  String overview = '';
  double popularity = 0.0;
  String posterPath = '';
  String releaseDate = '';
  String title = '';
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;

  Film({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Film.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>(); //Se convierte a entero
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] / 1; //Se convierte en double
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  getPosterImage() {
    // ignore: unnecessary_null_comparison
    if (posterPath == null) {
      return 'https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png';
    } else {}
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }
}
