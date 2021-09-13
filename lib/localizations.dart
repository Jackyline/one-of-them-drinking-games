// https://stackoverflow.com/questions/50067455/string-xml-file-in-flutter
// this class is used for localizations
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LanguageLocalizations {
  static LanguageLocalizations? of(BuildContext context) {
    return Localizations.of<LanguageLocalizations>(
        context, LanguageLocalizations);
  }

  String getText(String key) => language[key];
}

Map<String, dynamic> language = {};

class LanguageLocalizationsDelegate
    extends LocalizationsDelegate<LanguageLocalizations> {
  const LanguageLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'se', ', se_,'].contains(locale.languageCode);

  @override
  Future<LanguageLocalizations> load(Locale locale) async {
    String string =
        await rootBundle.loadString("strings/${locale.languageCode}.json");
    language = json.decode(string);
    return SynchronousFuture<LanguageLocalizations>(LanguageLocalizations());
  }

  @override
  bool shouldReload(LanguageLocalizationsDelegate old) => false;
}
