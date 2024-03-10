
import 'package:dio/dio.dart';
import 'package:movies/core/network/error_message_model.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/app_constance.dart';
import '../models/movie_model.dart';



abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  
  @override
  Future<List<MovieModel>> getNowPlaying() async{
    final response = await Dio().get(
     AppCounstance.nowPlayingMoviesPath
    );
    print(response);
    if(response.statusCode == 200){
      //Note: results is value from the json api response
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e)));

    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    
  }
  
  @override
  Future<List<MovieModel>> getPopularMovies() async{
   final response = await Dio().get(
     AppCounstance.popularMoviesPath
    );

    if(response.statusCode == 200){
      //Note: results is value from the json api response
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e)));

    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    
  }
  
  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(
     AppCounstance.topRatedMoviesPath
    );

    if(response.statusCode == 200){
      //Note: results is value from the json api response
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e)));

    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    
  }
  }
  


