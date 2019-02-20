import 'package:flutter/material.dart';
import 'package:tp3/app/components/learning.dart';
import 'package:tp3/app/components/training.dart';
import 'package:tp3/util/strings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return new _HomeState();
  }
}

const int NB_CHOICE = 3;

class _HomeState extends State<Home> {
  //BEN_CORRECTION : Pourquoi training n'est pas initialisé ici ?
  Training _training;
  Learning _learning = new Learning();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    _training = new Training();
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

  //BEN_CORRECTION : Nommage mensonger. Ce n'est pas ce que cela fait.
  //                 Je vois pas non plus pourquoi c'est pas dans la fonction "build" directement.
  Widget _changeAppBody(int index) {
    return Expanded(
      child: IndexedStack(
        index: _index,
        children: <Widget>[_showLearningBody(), _showTrainingBody()],
      ),
    );
  }

  //BEN_CORRECTION : Je comprends pas l'utilité de cette fonction.
  Widget _showLearningBody() {
    return _learning.showCardList();
  }

  //BEN_CORRECTION : Je comprends pas l'utilité de cette fonction.
  Widget _showTrainingBody() {
    return _training;
  }
}
