import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
