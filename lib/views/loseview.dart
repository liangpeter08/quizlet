import 'package:flutter/material.dart';

import './questionview.dart';

class LosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Let\'s Study Harder!')),
      body: Column(children: <Widget>[
        Container(
          child: Text('You\'ve made 6 mistakes, the exam only allows for 5'),
        ),
        MaterialButton(
            color: Color(0xFFFFFFFFF),
            elevation: 4.0,
            splashColor: Color(0xFFff9999),
            child: Text('Retry',
                style: TextStyle(
                    color: Color(0xFFff4d4d), fontWeight: FontWeight.bold)),
            onPressed: () => QuestionPage())
      ]),
    );
  }
}
