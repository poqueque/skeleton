import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base/base_state.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {

  bool firstStart = true;

  void initWorkflow() async {
    screenStateProvider?.screenStatus = "Loading...";
    await new Future.delayed(const Duration(seconds : 1));
    screenStateProvider?.screenStatus = "Step 1";
    await new Future.delayed(const Duration(seconds : 1));
    screenStateProvider?.screenStatus = "Step 2. Please wait a bit more...";
    showSnackBar("Snackbar");
    await new Future.delayed(const Duration(seconds : 1));
    var value = Random().nextInt(100);
    screenStateProvider?.counter = value;
    screenStateProvider?.screenStatus = "Step 3. Setting initial value to $value...";
    await new Future.delayed(const Duration(seconds : 1));
    screenStateProvider?.screenStatus = "Done.";
    await new Future.delayed(const Duration(seconds : 1));
    if (userProvider?.user == null)
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen()));
    else
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainScreen()));
  }

  @override
  Widget buildScreen(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/app_logo.png',
              height: 100,
              width: 100,
            ),
            space(),
            Text(screenStateProvider?.screenStatus,
            style: GoogleFonts.montserrat()),
          ],
        ),)
      ,
    );
  }
}
