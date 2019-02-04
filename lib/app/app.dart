import 'package:flutter/material.dart';
import 'package:tp3/app/home/home.dart';
import 'package:tp3/util/dimensions.dart';
import 'package:tp3/util/strings.dart';
import 'package:tp3/util/localizations.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var baseTheme = ThemeData.light();

    var theme = baseTheme.copyWith(
      primaryColor: Colors.redAccent,
      textTheme: baseTheme.textTheme.copyWith(
        display1: baseTheme.textTheme.display1.copyWith(
          fontSize: FontSizeDisplay1,
        ),
      ),
    );

    return MaterialApp(
      home: Home(),
      theme: theme,
      onGenerateTitle: (context) => Strings.of(context).title,
      localizationsDelegates: ApplicationLocalizationsDelegates,
      supportedLocales: ApplicationSupportedLocales,
    );
  }

}
