class Cast {
  List<Actor> actors = [];
  Cast.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actors.add(actor);
    });
  }
}

class Actor {
  bool adult = false;
  int gender = 0;
  int id = 0;
  String knownForDepartment = '';
  String name = '';
  String originalName = '';
  double popularity = 0.0;
  String profilePath = '';
  int castId = 0;
  String character = '';
  String creditId = '';
  int order = 0;
  String department = '';
  String job = '';

  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    knownForDepartment = json['known_for_department'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    department = json['department'];
    job = json['job'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getPhoto() {
    // ignore: unnecessary_null_comparison
    if (profilePath == null) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
