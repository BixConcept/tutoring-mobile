import 'package:flutter/material.dart';
import 'package:tutoring_mobile/components/bottom_nav_bar.dart';
import 'package:tutoring_mobile/views/settings.dart';

import 'search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;
  final _pages = [const MySearchPage(), const MySettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }
}
