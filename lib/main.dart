import 'package:flutter/material.dart';
import 'package:islami_application/homescreen.dart';
import 'package:islami_application/theme.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
