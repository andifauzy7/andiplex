import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/usecases/usecase.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_reviews.dart';
import 'package:andiplex/features/movies_info/domain/repositories/movies_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetReviewsMoviesUsecase
    extends UseCase<List<MoviesReviews>, GetReviewsMoviesParams> {
  final MoviesInfoRepository repository;

  GetReviewsMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MoviesReviews>>> call(
      GetReviewsMoviesParams params) async {
    return await repository.getReviewsMoviesUsecase(params.id);
  }
}

class GetReviewsMoviesParams extends Equatable {
  final int id;

  const GetReviewsMoviesParams({required this.id});
  @override
  List<Object> get props => [id];
}
