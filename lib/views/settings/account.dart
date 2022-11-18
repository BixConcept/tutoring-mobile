import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySettingsAccount extends StatelessWidget {
  const MySettingsAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.accountPageTitle),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Center(
        child: Text("account page"),
      ),
    );
  }
}
