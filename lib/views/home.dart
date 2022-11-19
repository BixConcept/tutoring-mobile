import 'package:flutter/material.dart';
import 'package:tutoring_mobile/components/bottom_nav_bar.dart';
import 'package:tutoring_mobile/views/settings.dart';
import 'package:tutoring_mobile/views/search.dart';

// This isn't really a page but rather the thing all actual "pages" are rendered within
// basically we're re-implementing navigation till we find a better alternative.
//
// The main drawback of this approac are that
//   1. OS-level back button doesn't work when changing tabs
//   2. this file/class is just named unintuitively
//
// Thank you for coming to my ted talk
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;
  final _pages = [const MySearchPage(), null, const MySettingsPage()];

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
