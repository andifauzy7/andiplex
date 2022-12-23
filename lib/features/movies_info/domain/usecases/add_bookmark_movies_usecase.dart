import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/usecases/usecase.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_info.dart';
import 'package:andiplex/features/movies_info/domain/repositories/movies_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddBookmarkMoviesUsecase extends UseCase<bool, AddBookmarkMoviesParams> {
  final MoviesInfoRepository repository;

  AddBookmarkMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(AddBookmarkMoviesParams params) async {
    return await repository.addBookmarkMoviesUsecase(params.moviesInfo);
  }
}

class AddBookmarkMoviesParams extends Equatable {
  final MoviesInfo moviesInfo;

  const AddBookmarkMoviesParams({required this.moviesInfo});
  @override
  List<Object> get props => [moviesInfo];
}
