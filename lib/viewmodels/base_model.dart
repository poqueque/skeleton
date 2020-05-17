import 'package:flutter/foundation.dart';

enum ViewState { Idle, Busy }

//From: https://www.youtube.com/watch?v=kDEflMYTFlk&feature=youtu.be
class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  delay(Duration duration) async {
    await Future.delayed(duration, () => {});
  }
}
