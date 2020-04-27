import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/providers/screen_state.dart';
import 'package:skeleton/providers/user.dart';

const String ACTION_RELOAD = "ACTION_RELOAD";
const String ACTION_POP = "ACTION_POP";
const String ACTION_POP_2 = "ACTION_POP_2";
const String ACTION_POP_3 = "ACTION_POP_3";
const String ACTION_POP_4 = "ACTION_POP_4";

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  T get baseWidget => widget;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey bannerAdKey = GlobalKey();

  Widget adBottomButtons;
  ScreenStateProvider screenStateProvider;
  UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    initWorkflow();
    onStart();
    currentBaseState = this;
  }

  // Called when the top route has been popped off, and the current route shows up.
  @override
  void didPopNext() {
    onStart();
  }

  Widget space({double size = 8}) {
    return Container(margin: EdgeInsets.all(size));
  }

  showSnackBar(String text) {
    scaffoldKey?.currentState?.showSnackBar(SnackBar(content: Text(text)));
  }

  hideSnackBar() {
    scaffoldKey?.currentState?.hideCurrentSnackBar();
  }

  Future<bool> confirm(String text) async {
    // flutter defined function
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Confirmar"),
          content: Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("CANCELAR"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  navigate(var toScreen) async {
    var screenName = toScreen.runtimeType.toString();
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => toScreen,
            settings: RouteSettings(name: screenName)));
    if (result == ACTION_POP_3)
      Navigator.of(context, rootNavigator: true).pop(ACTION_POP_2);
    if (result == ACTION_POP_2)
      Navigator.of(context, rootNavigator: true).pop(ACTION_POP);
    if (result == ACTION_POP)
      Navigator.of(context, rootNavigator: true).pop(ACTION_RELOAD);
    if (result == ACTION_RELOAD) reload();
  }

  get back => Navigator.of(context, rootNavigator: true).pop(ACTION_RELOAD);

  get back2 => Navigator.of(context, rootNavigator: true).pop(ACTION_POP);

  get back3 => Navigator.of(context, rootNavigator: true).pop(ACTION_POP_2);

  bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  bool firstStart = true;
  @override
  Widget build(BuildContext context) {
    if (screenStateProvider == null) {
      screenStateProvider = Provider.of<ScreenStateProvider>(context);
    }
    if (userProvider == null) {
      userProvider = Provider.of<UserProvider>(context);
    }
    return buildScreen(context);
  }

  Widget buildScreen(BuildContext context);

  void onStart() {}

  void initWorkflow() {}

  void reload() {
    onStart();
  }
}

BaseState currentBaseState;

showSnackBarOnCurrentScreen(String text) {
  if (currentBaseState != null)
    currentBaseState.scaffoldKey?.currentState
        ?.showSnackBar(SnackBar(content: Text(text)));
}
