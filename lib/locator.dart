import 'package:get_it/get_it.dart';
import 'package:skeleton/providers/counter_state.dart';
import 'providers/user.dart';
import 'viewmodels/splash_model.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => SplashModel());

  locator.registerLazySingleton(() => CounterStateProvider());
  locator.registerLazySingleton(() => UserProvider());
}
