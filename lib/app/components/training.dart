import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';
import 'package:tp3/app/home/home.dart';
import 'package:tp3/util/random.dart';

const NB_BUTTON = 3;
class Training extends StatefulWidget{

  _Training training;

  Training(RandomCard randomCard){
    training = new _Training(randomCard);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return training;
  }

}
class _Training extends State<Training>{
  RandomCard _randomCard;
  List<bool> _isChoiceCorrectList = new List();
  List<String> _buttonChoiceTextList;
  List<FlatButton> _buttonList = new List();


  Card pickedCard;

  _Training(RandomCard randomCard) {
    _randomCard = randomCard;
    initializeNewLetter();
  }

  Widget showTraining() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Expanded(child: pickedCard,),
            ],
          ),
        )
        ,
        _buttonList[0],
        _buttonList[1],
        _buttonList[2],
      ],
    );
  }
  void initializeNewLetter(){
    _isChoiceCorrectList.clear();
    _buttonList.clear();
    pickedCard = _randomCard.pickCard();
    _buttonChoiceTextList = _randomCard.pickButtonTextList();
    for (int i = 0; i < NB_BUTTON; i++) {
      _isChoiceCorrectList.add(true);
      _buttonList.add(FlatButton(
          textColor: _isChoiceCorrectList[i] ? Colors.blue : Colors.red
          , onPressed: _isChoiceCorrectList[i] ? () {
        changeButtonState(i
              , _buttonChoiceTextList[i]);} : null,
          child: Text(_buttonChoiceTextList[i])));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Expanded(child: pickedCard,),
            ],
          ),
        )
        ,
        _buttonList[0],
        _buttonList[1],
        _buttonList[2],
      ],
    );
  }
  void changeButtonState(int index, String choice) {
    setState(() {
      _isChoiceCorrectList[index] = choice == _randomCard.getWinningAnswer();
    });
    if (_isChoiceCorrectList[index]) {
      initializeNewLetter();
      showTraining();
    }
  }
}

/*void _isButtonChoiceCorrect(bool isChoiceCorrect, String choice) {
  isChoiceCorrect = choice == _randomCard.getWinningAnswer();
  if(isChoiceCorrect){
    _initializeNewLetter();
    showTraining();
  }

}*/
