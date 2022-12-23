import 'package:andiplex/core/error/exception.dart';
import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/util/constants.dart';
import 'package:andiplex/features/movies_info/data/models/movies_detail_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_now_playing_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_popular_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_reviews_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_upcoming_dto.dart';
import 'package:http/http.dart' as http;

abstract class MoviesInfoRemoteDataSource {
  Future<MoviesDetailDTO> getDetailMoviesUsecase(int id);
  Future<MoviesNowPlayingDTO> getNowPlayingMoviesUsecase();
  Future<MoviesPopularDTO> getPopularMoviesUsecase();
  Future<MoviesUpcomingDTO> getUpcomingMoviesUsecase();
  Future<MoviesReviewsDTO> getReviewsMoviesUsecase(int id);
}

class MoviesInfoRemoteDataSourceImpl implements MoviesInfoRemoteDataSource {
  final http.Client client;

  MoviesInfoRemoteDataSourceImpl({required this.client});
  @override
  Future<MoviesDetailDTO> getDetailMoviesUsecase(int id) async {
    final response = await client.get(
      Uri.https(
        Constants.movieApi.endpoint,
        '${Constants.movieApi.detail}/$id',
        {
          'api_key': Constants.movieApi.key,
        },
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return moviesDetailDtoFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MoviesNowPlayingDTO> getNowPlayingMoviesUsecase() async {
    final response = await client.get(
      Uri.https(
        Constants.movieApi.endpoint,
        Constants.movieApi.nowplaying,
        {
          'api_key': Constants.movieApi.key,
        },
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return moviesNowPlayingDtoFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MoviesPopularDTO> getPopularMoviesUsecase() async {
    final response = await client.get(
      Uri.https(
        Constants.movieApi.endpoint,
        Constants.movieApi.popular,
        {
          'api_key': Constants.movieApi.key,
        },
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return moviesPopularDtoFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MoviesReviewsDTO> getReviewsMoviesUsecase(int id) async {
    final response = await client.get(
      Uri.https(
        Constants.movieApi.endpoint,
        '${Constants.movieApi.detail}/$id/reviews',
        {
          'api_key': Constants.movieApi.key,
        },
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return moviesReviewsDtoFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MoviesUpcomingDTO> getUpcomingMoviesUsecase() async {
    final response = await client.get(
      Uri.https(
        Constants.movieApi.endpoint,
        Constants.movieApi.upcoming,
        {
          'api_key': Constants.movieApi.key,
        },
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return moviesUpcomingDtoFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
