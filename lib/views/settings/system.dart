import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tutoring_mobile/main.dart';

class MySettingsSystem extends StatefulWidget {
  const MySettingsSystem({super.key});

  @override
  State<MySettingsSystem> createState() => _MySettingsSystemState();
}

class _MySettingsSystemState extends State<MySettingsSystem> {
  final languages = {'de': 'Deutsch', 'en': 'English'};
  String languageValue = 'de';

  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration.zero, () {
      languageValue = Localizations.localeOf(context).languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider _locale = Provider.of<LocaleProvider>(context);
    setState(() {});

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.systemPageTitle),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            leading: const Icon(Icons.translate),
            trailing: DropdownButton(
              items: languages.entries
                  .map(
                    (entry) => DropdownMenuItem(
                      value: entry.key,
                      child: Text(entry.value),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(
                  () {
                    languageValue = value!;
                    _locale.setLocale(languageValue);
                  },
                );
              },
              value: languageValue,
            ),
          )
        ],
      ),
    );
  }
}
