

import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';

import '../../domain/repository/base_movies_repository.dart';
import '../datasource/movie_remote_data_source.dart';


class MoviesRepository extends BaseMoviesRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

    Future<Either<Failure, List<Movie>>> getNowPlaying() async{
     final result = await baseMovieRemoteDataSource.getNowPlaying();
     try{
      return Right(result as List<Movie>);
     } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
     }
    }
  
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
        final result = await baseMovieRemoteDataSource.getPopularMovies();
     try{
      return Right(result as List<Movie>);
     } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
     }
  }
  
  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
         final result = await baseMovieRemoteDataSource.getTopRatedMovies();
     try{
      return Right(result as List<Movie>);
     } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
     }
  }
  




  
}