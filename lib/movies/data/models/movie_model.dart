
import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      // required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

// Note: the dynamic should have the same name as the json key.
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    title: json["title"],
    backdropPath: json["backdrop_path"],
    // genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
    overview: json["overview"],
    voteAverage: json["vote_average"].toDouble(),
    releaseDate: json["release_date"],
  );
}
