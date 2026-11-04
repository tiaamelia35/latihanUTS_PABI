import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _username = '';
  String _nama = '';

  bool get isLoggedIn => _isLoggedIn;
  String get username => _username;
  String get nama => _nama;

  bool login(String username, String password) {
    if (username.trim().isNotEmpty && password.trim().isNotEmpty) {
      _isLoggedIn = true;
      _username = username.trim();
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isLoggedIn = false;
    _username = '';
    _nama = '';
    notifyListeners();
  }

  void updateNama(String newNama) {
    _nama = newNama;
    notifyListeners();
  }
}
