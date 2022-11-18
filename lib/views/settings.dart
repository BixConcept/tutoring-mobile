import 'package:flutter/material.dart';
import 'package:tutoring_mobile/components/bottom_nav_bar.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tutoring_mobile/views/settings/profile.dart';
import 'package:tutoring_mobile/views/settings/account.dart';
import 'package:tutoring_mobile/views/settings/listings.dart';
import 'package:tutoring_mobile/views/settings/system.dart';

class MySettingsPage extends StatelessWidget {
  const MySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(AppLocalizations.of(context)!.settingsTitle,
                style: Theme.of(context).textTheme.headline4),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(AppLocalizations.of(context)!.profile),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MySettingsProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: Text(AppLocalizations.of(context)!.listings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MySettingsListings(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_outlined),
            title: Text(AppLocalizations.of(context)!.account),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MySettingsAccount(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_applications),
            title: Text(AppLocalizations.of(context)!.system),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MySettingsSystem(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
