import 'package:flutter/material.dart';
import 'package:meditations_app/themes/theme_values.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = purpleTheme;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}