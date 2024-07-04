import 'package:flutter/material.dart';
import 'package:test_cammob/providerTest1/DarkLight/dark_light_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  void getCurrentAppTheme() async {
    _darkTheme = await darkThemePreference.getTheme();
    notifyListeners();
  }
}
