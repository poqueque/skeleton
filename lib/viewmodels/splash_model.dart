import 'dart:math';

import 'package:skeleton/providers/counter_state.dart';
import 'package:skeleton/providers/user.dart';

import '../locator.dart';
import 'base_model.dart';

class SplashModel extends BaseModel {
  String _status = "Loading...";

  String get status => _status;

  set status(String newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  CounterStateProvider counterStateProvider = locator<CounterStateProvider>();
  UserProvider userProvider = locator<UserProvider>();

  Future<bool> workflow() async {
    status = "Loading...";
    await new Future.delayed(const Duration(seconds: 1));
    status = "Step 1";
    await new Future.delayed(const Duration(seconds: 1));
    status = "Step 2. Please wait a bit more...";
    await new Future.delayed(const Duration(seconds: 1));
    var value = Random().nextInt(100);
    counterStateProvider.counter = value;
    status = "Step 3. Setting initial value to $value...";
    await new Future.delayed(const Duration(seconds: 1));
    status = "Done.";
    await new Future.delayed(const Duration(seconds: 1));
    if (userProvider?.user == null)
      //TODO: Go to Login
      return false;
    else
      //TODO: Go to Main
      return true;
  }
}
