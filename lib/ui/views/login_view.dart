import 'package:flutter/material.dart';
import 'package:skeleton/animation/fade_animation.dart';
import 'package:skeleton/routes.dart';
import 'package:skeleton/ui/views/base_view.dart';
import 'package:skeleton/ui/widgets/Space.dart';
import 'package:skeleton/viewmodels/base_model.dart';
import 'package:skeleton/viewmodels/login_model.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xff21254A),
              body: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Space(size: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            1,
                            Text(
                              "Hello there, \nwelcome back",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          FadeAnimation(
                            1,
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[100],
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                      controller: loginController,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[100],
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                      controller: passwordController,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          if (model.error != null)
                            Center(
                              child: FadeAnimation(
                                1,
                                Text(
                                  model.error,
                                  style: TextStyle(
                                    color: Colors.pink[200],
                                  ),
                                ),
                              ),
                            ),
                          Center(
                            child: FadeAnimation(
                              1,
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.pink[200],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          FadeAnimation(
                            1,
                            GestureDetector(
                              onTap: () async {
                                bool success = await model.login(
                                    loginController.text,
                                    passwordController.text);
                                if (success)
                                  Navigator.pushNamed(context, Routes.Main);
                              },
                              child: (model.state == ViewState.Busy)
                                  ? Center(child: CircularProgressIndicator())
                                  : Container(
                                      height: 50,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 60),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color.fromRGBO(49, 39, 79, 1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          FadeAnimation(
                            1,
                            Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  color: Colors.pink[200],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
