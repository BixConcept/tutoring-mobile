import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tutoring_mobile/api.dart';
import 'package:tutoring_mobile/models/subject.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // FIXME: fetch
  final subjectEmojis = {"Biologie": ""};

  late Future<List<Subject>> _subjects;

  Future<List<Subject>> _fetchSubjects() async {
    final response = await http.get(Uri.parse("${API_URL}/subjects"));
    List<Subject> subjects = (jsonDecode(response.body)["content"] as List)
        .map(((s) => Subject.fromJson(s)))
        .toList();

    debugPrint(subjects.toString());

    return subjects;
  }

  @override
  void initState() {
    _subjects = _fetchSubjects();
    setState(() {});

    super.initState();
  }

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
                      child: FutureBuilder(
                        future: _fetchSubjects(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final subject =
                                    (snapshot.data.elementAt(index) as Subject);
                                final subjectEmoji = subjectEmojis[subject.id] ?? '';

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
                                                  subject.name,
                                                  maxLines: null,
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                              Text(subjectEmoji,
                                                  style: const TextStyle(
                                                      fontSize: 30))
                                            ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                );
                              },
                              itemCount: snapshot.data.length,
                            );
                          } else if (snapshot.hasError) {
                            return Text("error: ${snapshot.error}");
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )),
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
