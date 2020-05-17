import 'package:flutter/foundation.dart';

class CounterStateProvider with ChangeNotifier {
  int _counter = 0;

  get counter => _counter;

  set counter(int c) {
    _counter = c;
    notifyListeners();
  }
}
