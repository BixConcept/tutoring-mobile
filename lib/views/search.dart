import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySearchPage extends StatelessWidget {
  const MySearchPage({super.key});

  // FIXME fetch
  final subjects = const ["Englisch", "Deutsch", "Franzosisch", "Latein"];

  final subjectEmojis = const ["🇬🇧", "🇱🇮", "🇦🇩", "📜"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink.shade400,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppLocalizations.of(context)!.searchTitle,
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final subject = subjects.elementAt(index);
                    final subjectEmoji = subjectEmojis.elementAt(index);

                    return Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          width: 170,
                          height: 100,
                          padding: const EdgeInsets.all(20),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    subject,
                                    maxLines: null,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(subjectEmoji,
                                    style: const TextStyle(fontSize: 30))
                              ]),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  },
                  itemCount: subjects.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
