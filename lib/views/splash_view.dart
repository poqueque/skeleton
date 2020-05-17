import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/viewmodels/splash_model.dart';
import 'package:skeleton/widgets/Space.dart';

import '../locator.dart';
import 'login_view.dart';
import 'main_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    workflow();
  }

  void workflow() async {
    bool logged = await locator<SplashModel>().workflow();
    if (logged)
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainView()));
    else
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashModel>(
        create: (context) => locator<SplashModel>(),
      child: Consumer<SplashModel>(
        builder: (BuildContext context, SplashModel model, Widget child) =>
            Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/app_logo.png',
                  height: 100,
                  width: 100,
                ),
                Space(),
                Text(model.status,
                    style: GoogleFonts.montserrat()),
              ],
            ),)
          ,
        ),
      ),
    );
  }
}
