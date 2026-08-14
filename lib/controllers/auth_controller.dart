import 'package:flutter/material.dart';

/// Pure Flutter ChangeNotifier handling mock user authentication, profile details,
/// and theme preferences without third-party frameworks.
class AuthController extends ChangeNotifier {
  bool _isAuthenticated = false;
  String _userName = "Syed Waleed Hussain";
  String _email = "syedwaleedhussain11@gmail.com";
  final String _phone = "+92 315 2593961";
  bool _isDarkMode = false;
  int _rewardPoints = 480;

  bool get isAuthenticated => _isAuthenticated;
  String get userName => _userName;
  String get email => _email;
  String get phone => _phone;
  bool get isDarkMode => _isDarkMode;
  int get rewardPoints => _rewardPoints;

  /// Simulates a login action with simple validation.
  bool login(String email, String password) {
    if (email.trim().isNotEmpty && password.trim().length >= 4) {
      _isAuthenticated = true;
      _email = email.trim();
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Simulates a signup action.
  bool signup(String name, String email, String password) {
    if (name.trim().isNotEmpty && email.trim().isNotEmpty && password.trim().length >= 4) {
      _isAuthenticated = true;
      _userName = name.trim();
      _email = email.trim();
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Toggles dark mode.
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  /// Adds points upon successful orders.
  void addRewardPoints(int points) {
    _rewardPoints += points;
    notifyListeners();
  }

  /// Logs out the user.
  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
