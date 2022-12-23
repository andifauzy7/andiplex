import 'package:andiplex/core/components/movie_card.dart';
import 'package:andiplex/core/service_locator/service_locator.dart';
import 'package:andiplex/core/util/constants.dart';
import 'package:andiplex/core/view_state/view_state.dart';
import 'package:andiplex/features/movies_info/presentation/detail/page/detail_page.dart';
import 'package:andiplex/features/movies_info/presentation/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final double heightSection = 260;

  final MainController _controller = Get.put(
    MainController(
      getNowPlayingMoviesUsecase: sl(),
      getPopularMoviesUsecase: sl(),
      getUpcomingMoviesUsecase: sl(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchNowPlaying();
    _controller.fetchPopular();
    _controller.fetchUpcoming();
  }

  void _navigateToMovieDetail(int movieId, String movieTitle) => Get.to(
        DetailPage(
          movieId: movieId,
          movieTitle: movieTitle,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.word.appName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: Text(Constants.word.nowPlaying),
            ),
            SizedBox(
              height: heightSection,
              child: Center(
                child: Obx(() {
                  switch (_controller.viewStateNowPlaying.value.status) {
                    case Status.INITIAL:
                      return const CircularProgressIndicator();
                    case Status.LOADING:
                      return const CircularProgressIndicator();
                    case Status.COMPLETED:
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.listNowPlaying.length,
                          itemBuilder: (context, index) {
                            return MovieCard(
                              image:
                                  _controller.listNowPlaying[index].posterPath,
                              title: _controller.listNowPlaying[index].title,
                              onTap: () => _navigateToMovieDetail(
                                  _controller.listNowPlaying[index].id ?? 0,
                                  _controller.listNowPlaying[index].title ??
                                      ''),
                            );
                          });
                    case Status.ERROR:
                      return Text(
                          _controller.viewStateNowPlaying.value.message);
                  }
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: Text(Constants.word.popular),
            ),
            SizedBox(
              height: heightSection,
              child: Center(
                child: Obx(() {
                  switch (_controller.viewStatePopular.value.status) {
                    case Status.INITIAL:
                      return const CircularProgressIndicator();
                    case Status.LOADING:
                      return const CircularProgressIndicator();
                    case Status.COMPLETED:
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.listPopular.length,
                          itemBuilder: (context, index) {
                            return MovieCard(
                              image: _controller.listPopular[index].posterPath,
                              title: _controller.listPopular[index].title,
                              onTap: () => _navigateToMovieDetail(
                                  _controller.listPopular[index].id ?? 0,
                                  _controller.listPopular[index].title ?? ''),
                            );
                          });
                    case Status.ERROR:
                      return Text(_controller.viewStatePopular.value.message);
                  }
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
              child: Text(Constants.word.upcoming),
            ),
            SizedBox(
              height: heightSection,
              child: Center(
                child: Obx(() {
                  switch (_controller.viewStateUpcoming.value.status) {
                    case Status.INITIAL:
                      return const CircularProgressIndicator();
                    case Status.LOADING:
                      return const CircularProgressIndicator();
                    case Status.COMPLETED:
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.listUpcoming.length,
                          itemBuilder: (context, index) {
                            return MovieCard(
                              image: _controller.listUpcoming[index].posterPath,
                              title: _controller.listUpcoming[index].title,
                              onTap: () => _navigateToMovieDetail(
                                  _controller.listUpcoming[index].id ?? 0,
                                  _controller.listUpcoming[index].title ?? ''),
                            );
                          });
                    case Status.ERROR:
                      return Text(_controller.viewStateUpcoming.value.message);
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
