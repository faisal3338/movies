import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie.dart';


class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies; //state if data is get
  final RequestState nowPlayingState; // state if data is loading or error
  final String nowPlayingMessage;

  final List<Movie> popularMovies; //state if data is get
  final RequestState popularState; // state if data is loading or error
  final String popularMessage;

  final List<Movie> topRatedMovies; //state if data is get
  final RequestState topRatedState; // state if data is loading or error
  final String topRatedMessage;

  MoviesState(
      { this.nowPlayingMovies = const [],
       this.nowPlayingState = RequestState.loading,
       this.nowPlayingMessage = "",
       this.popularMovies = const [],
       this.popularState = RequestState.loading,
       this.popularMessage = "",
       this.topRatedMovies = const [],
       this.topRatedState = RequestState.loading,
       this.topRatedMessage = ""
       }); // if data is error use message
  @override
  List<Object?> get props => [
    nowPlayingMovies, nowPlayingState, nowPlayingMessage,
    popularMovies, popularState, popularMessage,
    topRatedMovies, topRatedState, topRatedMessage
    
    ];
}
