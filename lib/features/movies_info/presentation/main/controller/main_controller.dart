import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/usecases/usecase.dart';
import 'package:andiplex/core/view_state/view_state.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_info.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_popular_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetUpcomingMoviesUsecase getUpcomingMoviesUsecase;
  MainController({
    required this.getNowPlayingMoviesUsecase,
    required this.getPopularMoviesUsecase,
    required this.getUpcomingMoviesUsecase,
  });

  final Rx<ViewState> viewStateNowPlaying = ViewState.initial().obs;
  final List<MoviesInfo> listNowPlaying = [];

  final Rx<ViewState> viewStatePopular = ViewState.initial().obs;
  final List<MoviesInfo> listPopular = [];

  final Rx<ViewState> viewStateUpcoming = ViewState.initial().obs;
  final List<MoviesInfo> listUpcoming = [];

  Future<void> fetchNowPlaying() async {
    viewStateNowPlaying(
      ViewState.loading(),
    );
    Either<Failure, List<MoviesInfo>> result =
        await getNowPlayingMoviesUsecase.call(
      NoParams(),
    );

    result.fold((l) {
      viewStateNowPlaying(
        ViewState.error(
          l.toString(),
        ),
      );
    }, (r) {
      viewStateNowPlaying(
        ViewState.completed(r),
      );
      listNowPlaying.clear();
      listNowPlaying.addAll(r);
    });
  }

  Future<void> fetchPopular() async {
    viewStatePopular(
      ViewState.loading(),
    );
    Either<Failure, List<MoviesInfo>> result =
        await getPopularMoviesUsecase.call(
      NoParams(),
    );

    result.fold((l) {
      viewStatePopular(
        ViewState.error(
          l.toString(),
        ),
      );
    }, (r) {
      viewStatePopular(
        ViewState.completed(r),
      );
      listPopular.clear();
      listPopular.addAll(r);
    });
  }

  Future<void> fetchUpcoming() async {
    viewStateUpcoming(
      ViewState.loading(),
    );
    Either<Failure, List<MoviesInfo>> result =
        await getUpcomingMoviesUsecase.call(
      NoParams(),
    );

    result.fold((l) {
      viewStateUpcoming(
        ViewState.error(
          l.toString(),
        ),
      );
    }, (r) {
      viewStateUpcoming(
        ViewState.completed(r),
      );
      listUpcoming.clear();
      listUpcoming.addAll(r);
    });
  }
}
