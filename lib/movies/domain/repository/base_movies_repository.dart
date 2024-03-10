import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';


abstract class BaseMoviesRepository {
  //Here we have 3 Feture in Movies Screen: 1-playNow, 2-popular, 3- TopRated

  Future<Either<Failure ,List<Movie>>>getNowPlaying();
  Future<Either<Failure ,List<Movie>>> getPopularMovies();
  Future<Either<Failure ,List<Movie>>> getTopRatedMovies();
  
}
