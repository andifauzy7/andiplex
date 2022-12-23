import 'package:andiplex/core/error/failures.dart';
import 'package:andiplex/core/view_state/view_state.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_reviews.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_reviews_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  final GetReviewsMoviesUsecase getReviewsMoviesUsecase;
  ReviewController({required this.getReviewsMoviesUsecase});

  final Rx<ViewState> viewStateReviews = ViewState.initial().obs;
  final List<MoviesReviews> listReviews = [];

  Future<void> fetchReviews(int id) async {
    viewStateReviews(
      ViewState.loading(),
    );
    Either<Failure, List<MoviesReviews>> result =
        await getReviewsMoviesUsecase.call(
      GetReviewsMoviesParams(id: id),
    );

    result.fold((l) {
      viewStateReviews(
        ViewState.error(
          l.toString(),
        ),
      );
    }, (r) {
      viewStateReviews(
        ViewState.completed(r),
      );
      listReviews.clear();
      listReviews.addAll(r);
    });
  }
}
