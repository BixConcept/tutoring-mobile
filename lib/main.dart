import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tutoring_mobile/themeManager.dart';

import 'package:tutoring_mobile/views/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => LocaleProvider()),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (BuildContext context) => ThemeNotifier(),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application

  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  ThemeMode getTheme() {
    return _themeMode;
  }

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocaleProvider>(context);
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        locale: Locale(locale.locale),
        title: 'GymHaan App',
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: _themeMode,
        home: const MyHomePage(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('de', ''),
        ],
      ),
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
