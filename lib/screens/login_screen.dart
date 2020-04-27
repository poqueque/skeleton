import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:skeleton/providers/screen_state.dart';
import 'package:skeleton/screens/main_screen.dart';

import 'base/base_state.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return FlutterLogin(
      title: 'Test',
      logo: 'assets/images/app_logo.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  Future<String> _authUser(LoginData loginData) {
  }

  Future<String> _recoverPassword(String string) {
  }
}
