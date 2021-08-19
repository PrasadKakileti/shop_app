import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier{

  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  set darkTheme(bool changeTheme){
    _isDarkTheme = changeTheme;
    notifyListeners();
  }
}