import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  Color get backgroundColor => _isDarkMode ? Colors.black : Colors.white;
  Color get textColor => _isDarkMode ? Colors.white : Colors.black;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
