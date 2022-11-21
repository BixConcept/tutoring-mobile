import 'package:flutter/material.dart';
import 'package:tutoring_mobile/storageManager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: Color.fromARGB(255, 15, 15, 15),
      dividerColor: Colors.black12,
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.grey.shade100)));

  final lightTheme = ThemeData(
    // primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    fontFamily: 'Raleway',
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
  );

  late ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }
}
