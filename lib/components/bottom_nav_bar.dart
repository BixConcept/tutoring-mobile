import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tutoring_mobile/views/tutoring.dart';

import '../views/settings.dart';
import '../main.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int) onTap;
  int currentIndex;
  BottomNavBar({required this.onTap, required this.currentIndex, super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  _BottomNavBarState();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (value) {
        widget.onTap(value);
        setState(
          () {
            widget.currentIndex = value;
          },
        );
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: Theme.of(context).primaryIconTheme,
      selectedItemColor: Colors.green.shade400,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.sick_outlined),
            label: AppLocalizations.of(context)!.sickNote),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings),
      ],
    );
  }
}
