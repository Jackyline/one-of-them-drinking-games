import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ytterligare_ett_forfestspel/rules_view.dart';
import 'package:ytterligare_ett_forfestspel/settings_view.dart';

import 'localizations.dart';

void main() {
  runApp(MaterialApp(
    locale: const Locale("se"), // switch between en and ru to see effect
    localizationsDelegates: const [LanguageLocalizationsDelegate()],
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('se_SE', 'SE'),
    ],
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const double paddingBetweenButtons = 80;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/party.gif', width: 192, height: 192),
            const SizedBox(height: paddingBetweenButtons - 40),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {},
              child: const Text('Börja festen',
                  style: TextStyle(fontSize: 40.0, color: Colors.black)),
            ),
            const SizedBox(height: paddingBetweenButtons),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RulesView()),
                );
              },
              child: const Text('Lär dig reglerna',
                  style: TextStyle(fontSize: 40.0, color: Colors.black)),
            ),
            const SizedBox(height: paddingBetweenButtons),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsView()),
                );
              },
              child: const Text('Inställningar',
                  style: TextStyle(fontSize: 40.0, color: Colors.black)),
            ),
            const SizedBox(height: paddingBetweenButtons),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {},
              child: const Text('Skicka in frågor',
                  style: TextStyle(fontSize: 40.0, color: Colors.black)),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
