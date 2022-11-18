import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import './views/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => LocaleProvider(),
      )
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      locale: Locale(locale.locale),
      title: 'GymHaan App',
      darkTheme: ThemeData(
          brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
      home: MyHomePage(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('de', ''),
        // Locale('ua', ''),
      ],
    );
  }
}

class LocaleProvider extends ChangeNotifier {
  String _locale = 'de';
  String get locale => _locale;

  LocaleProvider();

  void setLocale(String locale) {
    _locale = locale;
    notifyListeners();
  }
}
