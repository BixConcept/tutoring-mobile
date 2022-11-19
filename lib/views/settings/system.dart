import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  late bool dark;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      languageValue = Localizations.localeOf(context).languageCode;
    });

    // GET SE THEME
    if (MyApp.of(context).getTheme() == ThemeMode.dark) {
      dark = true;
    } else if (MyApp.of(context).getTheme() == ThemeMode.light) {
      dark = false;
    } else if (MyApp.of(context).getTheme() == ThemeMode.system) {
      dark = SchedulerBinding.instance.platformDispatcher.platformBrightness==Brightness.dark?true:false;
    }
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
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
                    locale.setLocale(languageValue);
                  },
                );
              },
              value: languageValue,
            ),
          ),
          ListTile(
            title: const Text("Theme"),
            trailing: IconButton(
              icon: dark != true
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
              onPressed: () {
                setState(
                  () {
                    if (dark) {
                      MyApp.of(context).changeTheme(ThemeMode.light);
                    } else {
                      MyApp.of(context).changeTheme(ThemeMode.dark);
                    }
                    dark = !dark;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
