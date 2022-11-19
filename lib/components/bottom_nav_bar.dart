import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tutoring_mobile/views/home.dart';

import '../views/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {super.key, required this.onTap, required this.currentIndex});

  final void Function(int) onTap;
  final int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState(onTap, currentIndex);
}

class _BottomNavBarState extends State<BottomNavBar> {
  final void Function(int) _onTap;
  int _currentIndex;
  _BottomNavBarState(this._onTap, this._currentIndex);

  final pages = [MyHomePage(), MySettingsPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        _onTap(value);
        setState(
          () {
            _currentIndex = value;
          },
        );
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppLocalizations.of(context)!.search),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings),
      ],
    );
  }
}
