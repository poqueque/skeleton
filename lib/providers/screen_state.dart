import 'package:flutter/foundation.dart';

class ScreenStateProvider with ChangeNotifier {
  String _screenStatus = "";
  int _counter = 0;

  get screenStatus => _screenStatus;

  set screenStatus(String status) {
    _screenStatus = status;
    notifyListeners();
  }

  get counter => _counter;

  set counter(int c) {
    _counter = c;
    notifyListeners();
  }
}
