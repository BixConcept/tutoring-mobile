import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MySickNotePage extends StatelessWidget {
  const MySickNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Krankmeldung",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "TODO — bitte auf ",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2!.color)),
              TextSpan(
                text: "krankmeldung.gymhaan.de",
                style: TextStyle(color: Colors.blue),
                recognizer: (TapGestureRecognizer()
                  ..onTap = () async {
                    debugPrint("asdf");
                    await launchUrl(
                      Uri.parse("https://krankmeldung.gymhaan.de"),
                    );
                  }),
              ),
              TextSpan(
                text: " Krankmeldungen durchführen",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2!.color),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
