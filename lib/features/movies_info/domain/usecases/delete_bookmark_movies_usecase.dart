import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/usecases/usecase.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_info.dart';
import 'package:andiplex/features/movies_info/domain/repositories/movies_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteBookmarkMoviesUsecase
    extends UseCase<bool, DeleteBookmarkMoviesParams> {
  final MoviesInfoRepository repository;

  DeleteBookmarkMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(DeleteBookmarkMoviesParams params) async {
    return await repository.deleteBookmarkMoviesUsecase(params.moviesInfo);
  }
}

class DeleteBookmarkMoviesParams extends Equatable {
  final MoviesInfo moviesInfo;

  const DeleteBookmarkMoviesParams({required this.moviesInfo});
  @override
  List<Object> get props => [moviesInfo];
}
