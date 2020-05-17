import 'package:flutter/foundation.dart';

enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
