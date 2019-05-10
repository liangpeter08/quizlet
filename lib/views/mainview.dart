import 'package:flutter/material.dart';
import 'package:new_quizlet/util/populate.dart';

import './questionview.dart';
import '../util/readcsv.dart';
import '../util/populate.dart';

const int TEST_LENGTH = 3;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void startHandler(context) async {
    List<List<String>> questions = await readcsv();
    int maxRange = questions.length;
    List<int> selectedQuestions = generateQuestions(TEST_LENGTH, maxRange);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionPage(questions: questions, selectedQuestions: selectedQuestions)));
  }

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
          onPressed: () => startHandler(context),
        )));
  }
}
