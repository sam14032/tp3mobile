import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tp3/util/strings.dart';

//Reason : Made with constant values.
// ignore: non_constant_identifier_names
final Iterable<Locale> ApplicationSupportedLocales = StringValues.keys.map((it) => Locale(it));

const Iterable<LocalizationsDelegate> ApplicationLocalizationsDelegates = [
  ApplicationLocalizationsDelegate.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

class ApplicationLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  const ApplicationLocalizationsDelegate._internal();

  static const ApplicationLocalizationsDelegate delegate = ApplicationLocalizationsDelegate._internal();

  @override
  bool isSupported(Locale locale) => StringValues.containsKey(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => SynchronousFuture<Strings>(Strings(locale));

  @override
  bool shouldReload(ApplicationLocalizationsDelegate old) => false;
}
