import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletons/skeletons.dart';

import '../api.dart';
import '../models/subject.dart';

class MyTutoringPage extends StatefulWidget {
  const MyTutoringPage({this.subject, super.key});

  final Subject? subject;

  @override
  State<MyTutoringPage> createState() => _MyTutoringPageState();
}

class _MyTutoringPageState extends State<MyTutoringPage> {
  late Future<List<Subject>> _subjects;

  Future<List<Subject>> _fetchSubjects() async {
    final response = await http.get(Uri.parse("${API_URL}/subjects"));
    List<Subject> subjects = (jsonDecode(response.body)["content"] as List)
        .map(((s) => Subject.fromJson(s)))
        .toList();

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
    return Scaffold(
      body: Column(children: [
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Row(children: [
                SkeletonItem(
                  child: DropdownButton(items: null, onChanged: (_) async {}),
                )
              ]);
            }
          },
        )
      ]),
      appBar: AppBar(
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.searchTitle),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
