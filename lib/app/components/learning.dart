import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Learning {
  List<Card> learningCardList;

  Learning() {
    learningCardList = new List<Card>();
    InitLearningCardList();
  }

  void InitLearningCardList() {
    for (int i = 0; i < Hiraganas.length; i++) {
      learningCardList.add(new Card(
        child: Column(
          children: <Widget>[
            Expanded(child: FittedBox(child: Text(Hiraganas.keys.elementAt(i))),),
            Expanded(child: FittedBox(child: Text(Hiraganas.values.elementAt(i))))
          ],
        ),
      ));
    }
  }
}
