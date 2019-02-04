import 'package:flutter/material.dart';
import 'package:tp3/util/strings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var strings = Strings.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(strings.title),
        ),
        body: Center(child: Text("Hello World")));
  }
}
