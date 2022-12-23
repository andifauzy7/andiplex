import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/view_state/view_state.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_detail.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_detail_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final GetDetailMoviesUsecase getDetailMoviesUsecase;
  DetailController({
    required this.getDetailMoviesUsecase,
  });

  final Rx<ViewState> viewState = ViewState.initial().obs;
  late MoviesDetail moviesDetail;

  Future<void> fetchMovieDetail(int id) async {
    viewState(
      ViewState.loading(),
    );
    Either<Failure, MoviesDetail> result = await getDetailMoviesUsecase.call(
      GetDetailMoviesParams(id: id),
    );

    result.fold((l) {
      viewState(
        ViewState.error(
          l.toString(),
        ),
      );
    }, (r) {
      viewState(
        ViewState.completed(r),
      );
      moviesDetail = r;
    });
  }
}
