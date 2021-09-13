import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'localizations.dart';

class RulesView extends StatelessWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> keys = [
      "game_rules_welcome",
      "game_rules_info",
      "games_rules_NVHI_title",
      "games_rules_NVHI",
      "games_rules_PG_title",
      "games_rules_PG",
      "games_rules_B2B_title",
      "games_rules_B2B",
      "games_rules_Category_title",
      "games_rules_Category",
      "games_rules_Rhyme_title",
      "games_rules_Rhyme",
      "games_rules_Mission_title",
      "games_rules_Mission"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            LanguageLocalizations.of(context)?.getText("game_rules_title") ??
                "Error"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 20, // to apply margin in the main axis of the wrap
          runSpacing: 20,
          children: <Widget>[
            for (int i = 0; i < keys.length; i++) getWidget(i, keys, context)
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

  Widget getWidget(int index, List<String> keys, BuildContext context) {
    if (keys[index].contains("title")) {
      return (Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Text(
            LanguageLocalizations.of(context)?.getText(keys[index]) ?? "Error",
            style: TextStyle(
                fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          )));
    } else {
      if (index == 0) {
        return (Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Text(
              LanguageLocalizations.of(context)?.getText(keys[index]) ??
                  "Error",
              style: TextStyle(
                  fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )));
      } else if (index == keys.length - 1) {
        return (Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
            child: Text(
              LanguageLocalizations.of(context)?.getText(keys[index]) ??
                  "Error",
              style: TextStyle(
                  fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )));
      } else {
        return (Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              LanguageLocalizations.of(context)?.getText(keys[index]) ??
                  "Error",
              style: TextStyle(
                  fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )));
      }
    }
  }
}
