import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoring_mobile/themeManager.dart';
import 'package:tutoring_mobile/views/home.dart';

import 'package:tutoring_mobile/views/tutoring.dart';
import 'package:tutoring_mobile/views/settings.dart';
import 'package:tutoring_mobile/views/sickNote.dart';

import 'components/bottom_nav_bar.dart';

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
  int _tabIndex = 0;
  final _pages = [
    const MyHomePage(),
    const MySickNotePage(),
    const MySettingsPage()
  ];

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
        locale: locale.locale,
        title: 'GymHaan App',
        theme: ThemeNotifier().lightTheme,
        darkTheme: ThemeNotifier().darkTheme,
        themeMode: _themeMode,
        home: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  "GYMHAAN",
                  style: TextStyle(
                      letterSpacing: 5,
                      fontWeight: FontWeight.w400,
                      fontSize: 23),
                ),
                centerTitle: true,
                elevation: 0,
                foregroundColor: Theme.of(context).textTheme.bodyText2!.color,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
            bottomNavigationBar: BottomNavBar(
              currentIndex: _tabIndex,
              onTap: (index) {
                setState(() {
                  _tabIndex = index;
                });
              },
            ),
            body: _pages.elementAt(_tabIndex),
          );
        }),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('de', 'DE'),
          Locale('uk', 'UA')
        ],
      ),
    );
  }
}

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('de');

  Locale get locale => _locale;

  LocaleProvider() {
    _fetchLocale();
  }

  Future<void> _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    _locale = Locale(prefs.getString('language_code') ?? 'de',
        prefs.getString('country_code') ?? '');
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    // update in shared_preferences
    var prefs = await SharedPreferences.getInstance();

    prefs.setString('language_code', locale.languageCode);
    if (locale.countryCode != null) {
      prefs.setString('language_code', locale.countryCode!);
    }

    // update in state
    _locale = locale;
    notifyListeners();
  }
}
