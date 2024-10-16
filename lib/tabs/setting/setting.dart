import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';
  bool get isDark => themeMode == ThemeMode.dark;
  String get backgroundImageName => isDark ? 'dark_bg' : 'bg3' ;
  void changeTheme(ThemeMode selectedTheme){
    themeMode = selectedTheme;
    notifyListeners();
  }
  void changeLanguage (String selectedLanguage){
    languageCode = selectedLanguage;
    notifyListeners();
  }
}