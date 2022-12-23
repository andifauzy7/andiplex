class Constants {
  static MovieApi movieApi = const MovieApi();
  static MovieWord word = const MovieWord();
}

class MovieApi {
  const MovieApi();
  String get key => '22a1131ffe45ccb590fba8944603a7a3';
  String get endpoint => 'api.themoviedb.org';
  String get endpointImage => 'https://image.tmdb.org/t/p/w500/';
  String get nowplaying => '3/movie/now_playing';
  String get popular => '3/movie/popular';
  String get upcoming => '3/movie/upcoming';
  String get detail => '3/movie';
}

class MovieWord {
  const MovieWord();
  String get appName => 'Andiplex';
  String get nowPlaying => 'Now Playing';
  String get popular => 'Popular';
  String get upcoming => 'Upcoming';
  String get review => 'Review';
}
