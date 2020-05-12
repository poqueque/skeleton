import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/providers/screen_state.dart';
import 'package:skeleton/providers/user.dart';
import 'package:skeleton/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Steps to change the package name
  // https://medium.com/@skyblazar.cc/how-to-change-the-package-name-of-your-flutter-app-4529e6e6e6fc
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScreenStateProvider>(
            create: (_) => ScreenStateProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Skeleton App',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            )),
        home: SplashScreen(),
      ),
    );
  }
}
