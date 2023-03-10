import 'package:andiplex/core/network/network_info.dart';
import 'package:andiplex/core/service_locator/service_locator.dart';
import 'package:andiplex/features/movies_info/di/movies_info_dependencies.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Injection {
  Future<void> initialize() async {
    await _registerCoreDependencies();
    _registerDependencies();
  }

  void _registerDependencies() {
    MoviesInfoDependencies();
  }

  Future<void> _registerCoreDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        connectionChecker: sl(),
      ),
    );
  }
}
