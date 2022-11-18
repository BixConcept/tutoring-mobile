import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySettingsListings extends StatelessWidget {
  const MySettingsListings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.listingsPageTitle),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Center(
        child: Text("listings page"),
      ),
    );
  }
}
