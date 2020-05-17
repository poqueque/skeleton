import 'dart:math';

import 'package:skeleton/core/model/user.dart';
import 'package:skeleton/core/services/api.dart';
import 'package:skeleton/providers/counter_state.dart';
import 'package:skeleton/providers/user.dart';

import '../locator.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  String _error;

  int get user => userProvider.user;

  String get error => _error;

  set error(String error) {
    _error = error;
    notifyListeners();
  }

  UserProvider userProvider = locator<UserProvider>();
  Api api = locator<Api>();

  Future<bool> login(String user, String password) async {
    error = null;
    state = ViewState.Busy;
    await delay(Duration(seconds: 1));
    User user = await api.getUserProfile(1+Random().nextInt(10));
    userProvider.user = user.name;
    if (password != "") return true;
    state = ViewState.Idle;
    error = "Wrong username or password";
    return false;
  }
}
