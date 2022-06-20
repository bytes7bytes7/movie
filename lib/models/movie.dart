import '../constants/movie.dart' as const_movie;

class Movie {
  final String? id;
  final String? title;
  final String? description;
  final String? cover;
  final String? bigCover;
  final double? rating;
  final List<String>? genres;

  Movie.fromJson(Map<String, dynamic> json)
      : id = json[const_movie.id],
        title = json[const_movie.title],
        description = json[const_movie.description],
        cover = json[const_movie.cover],
        bigCover = json[const_movie.bigCover],
        rating = json[const_movie.rating],
        genres = (json[const_movie.genres] as List)
            .map<String>((e) => (e as Map)[const_movie.value])
            .toList();
}
