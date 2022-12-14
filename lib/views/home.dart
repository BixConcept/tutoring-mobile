import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // FIXME: fetch
  final subjects = const ["Mathe", "Englisch", "Franzosisch", "Latein"];

  final subjectEmojis = const ["🇬", "🇱🇮", "🇦🇩", "📜"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade400,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
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
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: SizedBox(
                                width: 170,
                                height: 100,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      },
                      itemCount: subjects.length,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const StadiumBorder(),
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30)),
                    onPressed: () {
                      // TODO
                    },
                    child: Row(children: [
                      Text(
                        AppLocalizations.of(context)!.otherSubjects,
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward),
                    ]),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("News", style: Theme.of(context).textTheme.headlineMedium),
                Text(AppLocalizations.of(context)!.noNews)
              ],
            ),
          )
        ],
      ),
    );
  }
}
