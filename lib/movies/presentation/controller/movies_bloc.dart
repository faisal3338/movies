
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';
import 'package:movies/movies/presentation/controller/movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCas;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCas;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase, 
    this.getPopularMoviesUseCas, 
    this.getTopRatedMoviesUseCas): 
    super( MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit) async{
      final result = await getNowPlayingMoviesUseCase.execute();
      emit( MoviesState(nowPlayingState: RequestState.loaded));
      print(result);
      result.fold(
        (l) => emit(MoviesState(
        nowPlayingState: RequestState.error,
        nowPlayingMessage : l.message
      )), 
      
        (r) => emit(MoviesState(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded
        )));
    });

    on<GetPopularMoviesEvent>((event, emit)async{
      final result = await getPopularMoviesUseCas.execute();

      result.fold(
        ((l) => emit(MoviesState(
          popularState: RequestState.error,
          popularMessage: l.message,
        ))
      ),
      (r) => emit(MoviesState(
        popularMovies: r,
        popularState: RequestState.loaded,
      )));

    });

        on<GetTopRatedMoviesEvent>((event, emit)async{
      final result = await getTopRatedMoviesUseCas.execute();

      result.fold(
        ((l) => emit(MoviesState(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ))
      ),
      (r) => emit(MoviesState(
        topRatedMovies: r,
        topRatedState: RequestState.loaded,
      )));

    });
  }
}