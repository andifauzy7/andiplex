import 'package:andiplex/core/service_locator/service_locator.dart';
import 'package:andiplex/core/util/constants.dart';
import 'package:andiplex/core/view_state/view_state.dart';
import 'package:andiplex/features/movies_info/presentation/detail/controller/detail_controller.dart';
import 'package:andiplex/features/movies_info/presentation/review/page/review_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final int movieId;
  final String movieTitle;
  const DetailPage({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double headerSection = 240;

  final DetailController _controller = Get.put(
    DetailController(
      getDetailMoviesUsecase: sl(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchMovieDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          ReviewPage(
            movieId: widget.movieId,
            movieTitle: widget.movieTitle,
          ),
        ),
        child: const Icon(Icons.reviews),
      ),
      appBar: AppBar(
        title: Text(
          widget.movieTitle,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SizedBox(
        child: Center(
          child: Obx(() {
            switch (_controller.viewState.value.status) {
              case Status.INITIAL:
                return const CircularProgressIndicator();
              case Status.LOADING:
                return const CircularProgressIndicator();
              case Status.COMPLETED:
                return ListView(
                  children: [
                    SizedBox(
                      height: headerSection,
                      child: Stack(
                        children: [
                          Image.network(
                            Constants.movieApi.endpointImage +
                                (_controller.moviesDetail.backdropPath ?? ''),
                            width: double.infinity,
                            height: headerSection,
                            fit: BoxFit.cover,
                          ),
                          Center(
                            child: Image.network(
                              Constants.movieApi.endpointImage +
                                  (_controller.moviesDetail.posterPath ?? ''),
                              width: 120,
                              height: headerSection - 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_controller.moviesDetail.title ?? ''),
                          Text(_controller.moviesDetail.tagline ?? ''),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(_controller.moviesDetail.overview ?? '')
                        ],
                      ),
                    ),
                  ],
                );
              case Status.ERROR:
                return Text(_controller.viewState.value.message);
            }
          }),
        ),
      ),
    );
  }
}
