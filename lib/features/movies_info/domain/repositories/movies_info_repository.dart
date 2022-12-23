import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_detail.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_info.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_reviews.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesInfoRepository {
  Future<Either<Failure, bool>> addBookmarkMoviesUsecase(MoviesInfo moviesInfo);
  Future<Either<Failure, bool>> deleteBookmarkMoviesUsecase(
      MoviesInfo moviesInfo);
  Future<Either<Failure, MoviesDetail>> getDetailMoviesUsecase(int id);
  Future<Either<Failure, List<MoviesInfo>>> getNowPlayingMoviesUsecase();
  Future<Either<Failure, List<MoviesInfo>>> getPopularMoviesUsecase();
  Future<Either<Failure, List<MoviesInfo>>> getUpcomingMoviesUsecase();
  Future<Either<Failure, List<MoviesReviews>>> getReviewsMoviesUsecase(int id);
}
