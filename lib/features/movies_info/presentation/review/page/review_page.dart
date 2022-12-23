import 'package:andiplex/core/service_locator/service_locator.dart';
import 'package:andiplex/core/util/constants.dart';
import 'package:andiplex/core/view_state/view_state.dart';
import 'package:andiplex/features/movies_info/presentation/review/controller/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPage extends StatefulWidget {
  final int movieId;
  final String movieTitle;
  const ReviewPage({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ReviewController _controller = Get.put(
    ReviewController(
      getReviewsMoviesUsecase: sl(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchReviews(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Constants.word.review}: ${widget.movieTitle}',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SizedBox(
        child: Center(
          child: Obx(() {
            switch (_controller.viewStateReviews.value.status) {
              case Status.INITIAL:
                return const CircularProgressIndicator();
              case Status.LOADING:
                return const CircularProgressIndicator();
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: _controller.listReviews.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: Text(
                                  _controller.listReviews[index].content ?? ''))
                        ]),
                      );
                    });
              case Status.ERROR:
                return Text(_controller.viewStateReviews.value.message);
            }
          }),
        ),
      ),
    );
  }
}
