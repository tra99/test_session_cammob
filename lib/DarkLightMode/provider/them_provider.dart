import 'package:flutter/material.dart';
import 'package:test_cammob/DarkLightMode/theme/theme.dart';

class ThemProvider with ChangeNotifier{
  ThemeData _themeData=lightMode;

  ThemeData get themeData=>_themeData;

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==lightMode){
      themeData=darkMode;
    }else{
      themeData=lightMode;
    }
  }
}