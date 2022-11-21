import 'package:flutter/material.dart';
import 'package:tutoring_mobile/storageManager.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeNotifier with ChangeNotifier {
  final _darkBaseTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromARGB(255, 15, 15, 15),
    dividerColor: Colors.black12,
    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.grey.shade100)),
  );

  ThemeData buildDarkTheme() {
    return _darkBaseTheme.copyWith(
        textTheme: GoogleFonts.ralewayTextTheme(_darkBaseTheme.textTheme));
  }

  final _lightBaseTheme = ThemeData(
      // primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54);

  ThemeData buildLightTheme() {
    return _lightBaseTheme.copyWith(
        textTheme: GoogleFonts.ralewayTextTheme(_darkBaseTheme.textTheme));
  }

  late ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = buildLightTheme();
      } else {
        _themeData = buildDarkTheme();
      }
      notifyListeners();
    });
  }
}
