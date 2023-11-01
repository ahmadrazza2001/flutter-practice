import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _loggedInUsername = "";

  String get loggedInUsername => _loggedInUsername;

  void login(String username) {
    _loggedInUsername = username;
    notifyListeners();
  }

  void logout() {
    _loggedInUsername = "";
    notifyListeners();
  }
}
