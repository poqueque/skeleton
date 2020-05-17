import 'package:skeleton/providers/counter_state.dart';
import 'package:skeleton/providers/user.dart';

import '../locator.dart';
import 'base_model.dart';

class MainModel extends BaseModel {

  int get counter => counterStateProvider.counter;
  String get user => userProvider.user;

  set counter(int newCounter) {
    counterStateProvider.counter = newCounter;
    notifyListeners();
  }

  CounterStateProvider counterStateProvider = locator<CounterStateProvider>();
  UserProvider userProvider = locator<UserProvider>();
}
