import 'dart:math';

import 'package:tp3/app/hiragana/hiragana.dart';

const NB_BUTTONS = 3;

class RandomCard {
  int _index;
  List<String> _buttonList = new List();

  int _getRandomIndex() {
    return new Random().nextInt(Hiraganas.length - 1);
  }

  String getWinningAnswer() {
    return Hiraganas[Hiraganas.keys.elementAt(_index)];
  }

  String getGuessingLetter() {
    return Hiraganas.keys.elementAt(_index);
  }

  List<String> pickButtonTextList() {
    _index = _getRandomIndex();
    _buttonList.clear();
    _buttonList.add(Hiraganas[Hiraganas.keys.elementAt(_index)]);

    while (_buttonList.length < NB_BUTTONS) {
      String hiraganasToGet =
          Hiraganas[Hiraganas.keys.elementAt(_getRandomIndex())];
      if (!_buttonList.contains(hiraganasToGet))
        _buttonList.add(hiraganasToGet);
      _buttonList.shuffle();
    }
    return _buttonList;
  }
}
