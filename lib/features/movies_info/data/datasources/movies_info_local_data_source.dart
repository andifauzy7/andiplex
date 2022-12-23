import 'package:shared_preferences/shared_preferences.dart';

abstract class MoviesInfoLocalDataSource {}

class MoviesInfoLocalDataSourceImpl implements MoviesInfoLocalDataSource {
  final SharedPreferences sharedPreferences;

  MoviesInfoLocalDataSourceImpl({required this.sharedPreferences});
}
