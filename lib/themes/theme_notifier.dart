import 'package:flutter/material.dart';
import 'package:meditations_app/themes/theme_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = orangeTheme;

  ThemeNotifier(this._themeData);

  getTheme() {
    return _themeData;
  }

  setTheme(ThemeData themeData, String themeString) async {
    _themeData = themeData;
    setThemeSP(themeString);
    notifyListeners();
  }

  Future<void> setThemeSP(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }

  Future<ThemeData> getThemeSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeString = prefs.getString('theme') ?? "orangeTheme";
    ThemeData theme;
    if(themeString == "orangeTheme"){
      theme = orangeTheme;
    } else if(themeString == "greenTheme"){
      theme = greenTheme;
    } else if(themeString == "purpleTheme"){
      theme = purpleTheme;
    } else {
      theme = blueTheme;
    }
    _themeData = theme;
    return theme;
  }
}