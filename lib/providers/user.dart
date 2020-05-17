import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _user;

  get user => _user;

  set user(String user) {
    _user = user;
    //TODO: Store to preferences
    notifyListeners();
  }
}
