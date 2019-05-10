import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionPage> {
  onClick(int selected) {
    print('okay' + selected.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Quizlett'),
      ),
      body: ListView(children: <Widget>[
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 20.0), child: Text('Question')),
        ),
        Center(
          child: Container(
              child: RaisedButton(
            child: Text('Answer1'),
            onPressed: () => onClick(1),
          )),
        ),
        Center(
          child: Container(
              child: RaisedButton(
            child: Text('Answer2'),
            onPressed: () => onClick(2),
          )),
        ),
        Center(
          child: Container(
              child: RaisedButton(
            child: Text('Answer3'),
            onPressed: () => onClick(3),
          )),
        ),
        Center(
          child: Container(
              child: RaisedButton(
            child: Text('Answer4'),
            onPressed: () => onClick(4),
          )),
        ),
      ]),
    );
  }
}
