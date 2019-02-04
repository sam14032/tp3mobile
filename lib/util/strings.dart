import 'package:flutter/material.dart';

const Map<String, Map<String, String>> StringValues = {
  'en': {
    'title': 'Hiraganas',
    'learn': 'Learn',
    'train': 'Train',
  },
  'fr': {
    'title': 'Hiraganas',
    'learn': 'Apprendre',
    'train': 'Entrainement',
  },
};

class Strings {
  String get title => StringValues[_languageCode]['title'];

  String get learn => StringValues[_languageCode]['learn'];

  String get train => StringValues[_languageCode]['train'];

  //****************************************************
  //Implementation details. Mostly boilerplate code.
  //****************************************************

  final String _languageCode;

  Strings(Locale locale) : _languageCode = locale.languageCode;

  static Strings of(BuildContext context) => Localizations.of<Strings>(context, Strings);
}
