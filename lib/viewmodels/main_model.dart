import 'package:skeleton/providers/counter_state.dart';

import '../locator.dart';
import 'base_model.dart';

class MainModel extends BaseModel {
  int get counter => counterStateProvider.counter;

  set counter(int newCounter) {
    counterStateProvider.counter = newCounter;
    notifyListeners();
  }

  CounterStateProvider counterStateProvider = locator<CounterStateProvider>();
}
