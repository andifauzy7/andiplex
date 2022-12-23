import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/usecases/usecase.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_info.dart';
import 'package:andiplex/features/movies_info/domain/repositories/movies_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMoviesUsecase extends UseCase<List<MoviesInfo>, NoParams> {
  final MoviesInfoRepository repository;

  GetNowPlayingMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MoviesInfo>>> call(NoParams params) async {
    return await repository.getNowPlayingMoviesUsecase();
  }
}
