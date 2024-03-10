

import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies.dart';

import '../../movies/presentation/controller/movies_bloc.dart';


final sl =GetIt.instance;

class ServicesLocator {
  void init(){
    ///Bloc
sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    ///UseCase
    sl.registerLazySingleton(() =>new GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() =>new GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() =>new GetTopRatedMoviesUseCase(sl()));
    ///Repository
    sl.registerLazySingleton(
      () => MoviesRepository(sl()));

    ///DATA SOURCING
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () =>MovieRemoteDataSource());
  }
}