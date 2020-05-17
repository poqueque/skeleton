import 'package:flutter/material.dart';
import 'package:skeleton/ui/views/login_view.dart';
import 'package:skeleton/ui/views/main_view.dart';
import 'package:skeleton/ui/views/splash_view.dart';

// Based on https://itnext.io/flutter-navigation-routing-made-easy-816ddf9e2857
class Routes {
  static const String Splash = '/splash';
  static const String Main = '/main';
  static const String Login = '/login';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.Splash: (context) => SplashView(),
      Routes.Main: (context) => MainView(),
      Routes.Login: (context) => LoginView(),
    };
  }
}
