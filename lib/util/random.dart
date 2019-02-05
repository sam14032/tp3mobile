import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class RandomCard {
  int index;

  Card pick() {
    int index = new Random().nextInt(Hiraganas.length - 1);
    return new Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: FittedBox(child: Text(Hiraganas.keys.elementAt(index))),
          )
        ],
      ),
    );
  }
}
