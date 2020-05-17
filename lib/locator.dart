import 'package:get_it/get_it.dart';
import 'package:skeleton/providers/counter_state.dart';
import 'package:skeleton/viewmodels/login_model.dart';
import 'package:skeleton/viewmodels/main_model.dart';

import 'providers/user.dart';
import 'viewmodels/splash_model.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => SplashModel());
  locator.registerLazySingleton(() => MainModel());
  locator.registerLazySingleton(() => LoginModel());

  locator.registerLazySingleton(() => CounterStateProvider());
  locator.registerLazySingleton(() => UserProvider());
}
