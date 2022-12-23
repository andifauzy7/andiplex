import 'package:andiplex/core/service_locator/service_locator.dart';
import 'package:andiplex/features/movies_info/data/datasources/movies_info_local_data_source.dart';
import 'package:andiplex/features/movies_info/data/datasources/movies_info_remote_data_source.dart';
import 'package:andiplex/features/movies_info/data/repositories/movies_info_repository_impl.dart';
import 'package:andiplex/features/movies_info/domain/repositories/movies_info_repository.dart';
import 'package:andiplex/features/movies_info/domain/usecases/add_bookmark_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/delete_bookmark_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_detail_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_popular_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_reviews_movies_usecase.dart';
import 'package:andiplex/features/movies_info/domain/usecases/get_upcoming_movies_usecase.dart';

class MoviesInfoDependencies {
  MoviesInfoDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
  }

  void _registerUseCase() {
    sl.registerLazySingleton<AddBookmarkMoviesUsecase>(
      () => AddBookmarkMoviesUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<DeleteBookmarkMoviesUsecase>(
      () => DeleteBookmarkMoviesUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetDetailMoviesUsecase>(
      () => GetDetailMoviesUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetNowPlayingMoviesUsecase>(
      () => GetNowPlayingMoviesUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetReviewsMoviesUsecase>(
      () => GetReviewsMoviesUsecase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetUpcomingMoviesUsecase>(
      () => GetUpcomingMoviesUsecase(
        sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<MoviesInfoRepository>(
      () => MoviesInfoRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ),
    );
  }

  void _registerDataSource() {
    sl.registerLazySingleton<MoviesInfoRemoteDataSource>(
      () => MoviesInfoRemoteDataSourceImpl(
        client: sl(),
      ),
    );
    sl.registerLazySingleton<MoviesInfoLocalDataSource>(
      () => MoviesInfoLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    );
  }
}
