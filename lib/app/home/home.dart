import 'package:flutter/material.dart';
import 'package:tp3/app/components/learning.dart';
import 'package:tp3/app/components/training.dart';
import 'package:tp3/util/random.dart';
import 'package:tp3/util/strings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return new _HomeState();
  }
}

const int NB_CHOICE = 3;

class _HomeState extends State<Home> {
  RandomCard randomCard = new RandomCard();
  Training training;
  Learning learning = new Learning();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    training = new Training(randomCard);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.of(context).title),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _changeAppBody(_index),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.content_paste,
                    color: _index == 0 ? Colors.red : Colors.black,
                  ),
                  title: Text(
                    Strings.of(context).learn,
                    style: TextStyle(
                      color: _index == 0 ? Colors.red : Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.brush,
                    color: _index == 1 ? Colors.red : Colors.black,
                  ),
                  title: Text(
                    Strings.of(context).train,
                    style: TextStyle(
                      color: _index == 1 ? Colors.red : Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white),
            ],
            onTap: _onClickChangeAppState,
          )
        ],
      )),
    );
  }

  void _onClickChangeAppState(int index) {
    setState(() {
      _index = index;
    });
  }

  Widget _changeAppBody(int index) {
    return Expanded(
      child: IndexedStack(
        index: _index,
        children: <Widget>[_showLearningBody(), _showTrainingBody()],
      ),
    );
  }

  Widget _showLearningBody() {
    return learning.showCardList();
  }

  Widget _showTrainingBody() {
    return training;
  }
}
