import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/usecases/usecase.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_detail.dart';
import 'package:andiplex/features/movies_info/domain/repositories/movies_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetDetailMoviesUsecase
    extends UseCase<MoviesDetail, GetDetailMoviesParams> {
  final MoviesInfoRepository repository;

  GetDetailMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, MoviesDetail>> call(
      GetDetailMoviesParams params) async {
    return await repository.getDetailMoviesUsecase(params.id);
  }
}

class GetDetailMoviesParams extends Equatable {
  final int id;

  const GetDetailMoviesParams({required this.id});
  @override
  List<Object> get props => [id];
}
