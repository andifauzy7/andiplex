import 'package:andiplex/core/error/exception.dart';
import 'package:andiplex/core/network/network_info.dart';
import 'package:andiplex/features/movies_info/data/datasources/movies_info_local_data_source.dart';
import 'package:andiplex/features/movies_info/data/datasources/movies_info_remote_data_source.dart';
import 'package:andiplex/features/movies_info/data/mapper/movies_info_mapper.dart';
import 'package:andiplex/features/movies_info/data/models/movies_detail_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_info_model.dart';
import 'package:andiplex/features/movies_info/data/models/movies_now_playing_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_popular_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_reviews_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_upcoming_dto.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_reviews.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_info.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_detail.dart';
import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/features/movies_info/domain/repositories/movies_info_repository.dart';
import 'package:dartz/dartz.dart';

class MoviesInfoRepositoryImpl implements MoviesInfoRepository {
  final MoviesInfoRemoteDataSource remoteDataSource;
  final MoviesInfoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MoviesInfoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> addBookmarkMoviesUsecase(
      MoviesInfo moviesInfo) {
    // TODO: implement addBookmarkMoviesUsecase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteBookmarkMoviesUsecase(
      MoviesInfo moviesInfo) {
    // TODO: implement deleteBookmarkMoviesUsecase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MoviesDetail>> getDetailMoviesUsecase(int id) async {
    if (await networkInfo.isConnected) {
      try {
        MoviesDetailDTO remoteMovies =
            (await remoteDataSource.getDetailMoviesUsecase(id));

        /// TODO: OFFLINE ONLINE DATA
        MoviesDetail moviesInfo =
            MoviesInfoMapper.moviesDetailDtoToMoviesDetail(remoteMovies);
        return Right(moviesInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /// TODO: OFFLINE ONLINE DATA
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MoviesInfo>>> getNowPlayingMoviesUsecase() async {
    if (await networkInfo.isConnected) {
      try {
        MoviesNowPlayingDTO remoteMovies =
            (await remoteDataSource.getNowPlayingMoviesUsecase());

        /// TODO: OFFLINE ONLINE DATA
        List<MoviesInfo> moviesInfo = List<MoviesInfo>.from(
          remoteMovies.results?.map(
                (x) => MoviesInfoMapper.moviesInfoModelToMoviesInfo(x),
              ) ??
              [],
        );
        return Right(moviesInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /// TODO: OFFLINE ONLINE DATA
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MoviesInfo>>> getPopularMoviesUsecase() async {
    if (await networkInfo.isConnected) {
      try {
        MoviesPopularDTO remoteMovies =
            (await remoteDataSource.getPopularMoviesUsecase());

        /// TODO: OFFLINE ONLINE DATA
        List<MoviesInfo> moviesInfo = List<MoviesInfo>.from(
          remoteMovies.results?.map(
                (x) => MoviesInfoMapper.moviesInfoModelToMoviesInfo(x),
              ) ??
              [],
        );
        return Right(moviesInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /// TODO: OFFLINE ONLINE DATA
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MoviesReviews>>> getReviewsMoviesUsecase(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        MoviesReviewsDTO remoteMovies =
            (await remoteDataSource.getReviewsMoviesUsecase(id));

        /// TODO: OFFLINE ONLINE DATA
        List<MoviesReviews> moviesInfo = List<MoviesReviews>.from(
          remoteMovies.results?.map(
                (x) => MoviesInfoMapper.moviesReviewsModelToMoviesReviews(x),
              ) ??
              [],
        );
        return Right(moviesInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /// TODO: OFFLINE ONLINE DATA
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MoviesInfo>>> getUpcomingMoviesUsecase() async {
    if (await networkInfo.isConnected) {
      try {
        MoviesUpcomingDTO remoteMovies =
            (await remoteDataSource.getUpcomingMoviesUsecase());

        /// TODO: OFFLINE ONLINE DATA
        List<MoviesInfo> moviesInfo = List<MoviesInfo>.from(
          remoteMovies.results?.map(
                (x) => MoviesInfoMapper.moviesInfoModelToMoviesInfo(x),
              ) ??
              [],
        );
        return Right(moviesInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      /// TODO: OFFLINE ONLINE DATA
      return Left(CacheFailure());
    }
  }
}
