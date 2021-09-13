import 'package:flutter/material.dart';

import 'localizations.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    List<String> keys = [
      "settings_NHIE",
      "settings_PG",
      "settings_B2B",
      "settings_Category",
      "settings_Rhyme",
      "settings_Mission"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            LanguageLocalizations.of(context)?.getText("settings_title") ??
                "Error"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 20, // to apply margin in the main axis of the wrap
          runSpacing: 20,
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      LanguageLocalizations.of(context)
                              ?.getText("settings_main") ??
                          "Error",
                      style: TextStyle(
                          fontFamily:
                              DefaultTextStyle.of(context).style.fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ))),
            for (var key in keys) getWidget(key, context)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget getWidget(String key, BuildContext context) {
    bool isSwitched = false;
    return (Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              LanguageLocalizations.of(context)?.getText(key) ?? "Error",
              style: TextStyle(
                fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.yellow,
              activeColor: Colors.orangeAccent,
            )
          ],
        )));
  }
}
