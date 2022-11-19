import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyNotificationsPage extends StatefulWidget {
  const MyNotificationsPage({super.key});

  @override
  State<MyNotificationsPage> createState() => _MyNotificationsPageState();
}

class _MyNotificationsPageState extends State<MyNotificationsPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.systemPageTitle),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: ListView(
        children: [
          // noch eine Idee... auf Englisch: still an idea
          SwitchListTile(
              title: const Text("SV"), value: value, onChanged: (bool value) {})
        ],
      ),
    );
  }
}
