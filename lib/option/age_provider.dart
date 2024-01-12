import 'package:flutter/material.dart';

class AgeProvider extends ChangeNotifier {
  double _currentAge = 18;

  double get currentAge => _currentAge;

  void setAge(double newAge) {
    _currentAge = newAge;
    notifyListeners();
  }
}
