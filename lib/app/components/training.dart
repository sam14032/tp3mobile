import 'package:flutter/material.dart';
import 'package:tp3/util/random.dart';

const NB_BUTTON = 3;

class Training extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Training();
  }
}

class _Training extends State<Training> {
  RandomCard _randomCard = new RandomCard();
  List<bool> _areChoicesCorrect = new List();
  List<String> _buttonsChoiceText;
  List<FlatButton> _buttons = new List();

  _Training() {
    initializeNewLetter();
  }

  Widget _reloadView() {
    _buttons.clear();
    for (int i = 0; i < NB_BUTTON; i++)
      _buttons.add(FlatButton(
          disabledTextColor: Colors.red,
          onPressed: _areChoicesCorrect[i]
              ? () {
                  changeButtonState(i, _buttonsChoiceText[i]);
                }
              : null,
          child: Text(_buttonsChoiceText[i])));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Card(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: FittedBox(
                      child: Text(_randomCard.getGuessingLetter()),
                    ))
                  ],
                )),
              ),
            ],
          ),
        ),
        _buttons[0],
        _buttons[1],
        _buttons[2],
      ],
    );
  }

  void initializeNewLetter() {
    _areChoicesCorrect.clear();
    _buttons.clear();
    _buttonsChoiceText = _randomCard.pickButtonTextList();
    for (int i = 0; i < NB_BUTTON; i++) _areChoicesCorrect.add(true);
  }

  @override
  Widget build(BuildContext context) {
    _buttons.clear();
    for (int i = 0; i < NB_BUTTON; i++)
      _buttons.add(FlatButton(
          disabledTextColor: Colors.red,
          onPressed: _areChoicesCorrect[i]
              ? () {
                  changeButtonState(i, _buttonsChoiceText[i]);
                }
              : null,
          child: Text(_buttonsChoiceText[i])));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Card(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: FittedBox(
                      child: Text(_randomCard.getGuessingLetter()),
                    ))
                  ],
                )),
              ),
            ],
          ),
        ),
        _buttons[0],
        _buttons[1],
        _buttons[2],
      ],
    );
  }

  void changeButtonState(int index, String choice) {
    setState(() {
      _areChoicesCorrect[index] = choice == _randomCard.getWinningAnswer();
    });
    if (_areChoicesCorrect[index]) {
      initializeNewLetter();
      _reloadView();
    }
  }
}
