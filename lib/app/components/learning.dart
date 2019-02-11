import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Learning {
  List<Card> _learningCardList = new List<Card>();

  Learning() {
    _initLearningCardList();
  }

  void _initLearningCardList() {
    _learningCardList.clear();
    for (int i = 0; i < Hiraganas.length; i++) {
      _learningCardList.add(new Card(
        child: Column(
          children: <Widget>[
            Expanded(child: FittedBox(child: Text(Hiraganas.keys.elementAt(i))),),
            Expanded(child: FittedBox(child: Text(Hiraganas.values.elementAt(i))))
          ],
        ),
      ));
    }
  }

  Widget showCardList(){
    return GridView.count(
      crossAxisCount: 2,
      children: _learningCardList,
    );
  }
}
