import 'package:flutter/material.dart';
import 'package:tp3/app/components/learning.dart';
import 'package:tp3/util/random.dart';
import 'package:tp3/util/strings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.of(context).title),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          changeAppBody(index),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.content_paste),
                  title: Text(Strings.of(context).learn),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.brush),
                  title: Text("Entrainement"),
                  backgroundColor: Colors.white),
            ],
            onTap: changeAppState,
          )
        ],
      )),
    );
  }

  void changeAppState(int index) {
    setState(() {
      this.index = index;
    });
  }

  Widget changeAppBody(int index) {
    if (index == 0) {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          children: new Learning().learningCardList,
        ),
      );
    } else {
      return Expanded(
          child: Column(children: <Widget>[
        Expanded(
            child: GridView.count(
          crossAxisCount: 1,
          children: <Widget>[new RandomCard().pick()],
        )),
        Row(children: <Widget>[Expanded(
            child: RaisedButton(
              child: Text("A"),
            )),]),Row(children: <Widget>[Expanded(
            child: RaisedButton(
              child: Text("A"),
            )),]),Row(children: <Widget>[Expanded(
            child: RaisedButton(
              child: Text("A"),
            )),])
      ]));
    }
  }
}
