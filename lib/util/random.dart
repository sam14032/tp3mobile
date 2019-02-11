import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

const NB_BUTTONS = 3;

class RandomCard {
  int _index;
  List<String> _buttonList = new List();

  int _getRandomIndex() {
    return new Random().nextInt(Hiraganas.length - 1);
  }

  Card pickCard() {
    _index = _getRandomIndex();
    _buttonList.clear();
    _buttonList.add(Hiraganas[Hiraganas.keys.elementAt(_index)]);
    return new Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(child: FittedBox(child: Text(Hiraganas.keys.elementAt(_index))) ,)
          ],
        )
    );
  }

  String getWinningAnswer() {
    return Hiraganas[Hiraganas.keys.elementAt(_index)];
  }

  List<String> pickButtonTextList() {
    for (int i = 1; i < NB_BUTTONS; i++)
      _buttonList.add(Hiraganas[Hiraganas.keys.elementAt(_getRandomIndex())]);
    return _buttonList;
  }
}
