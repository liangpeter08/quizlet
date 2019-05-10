import 'package:flutter/material.dart';

import './questionview.dart';
import '../util/readcsv.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Quizlett'),
      ),
      body: Center(
          child: RaisedButton(
              child: Text('Begin Test'),
              onPressed: () {
                readcsv();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => QuestionPage()));
              })),
    );
  }
}
