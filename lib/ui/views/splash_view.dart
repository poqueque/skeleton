import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton/ui/widgets/Space.dart';
import 'package:skeleton/viewmodels/splash_model.dart';

import '../../routes.dart';
import 'base_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void workflow(SplashModel model) async {
    bool logged = await model.workflow();
    if (logged)
      Navigator.pushNamed(context, Routes.Main);
    else
      Navigator.pushNamed(context, Routes.Login);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashModel>(
      onModelReady: workflow,
      builder: (BuildContext context, SplashModel model, Widget child) =>
          Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/app_logo.png',
                height: 100,
                width: 100,
              ),
              Space(),
              Text(model.status, style: GoogleFonts.montserrat()),
            ],
          ),
        ),
      ),
    );
  }
}
