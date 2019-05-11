import 'package:flutter/material.dart';
import 'package:new_quizlet/util/populate.dart';
import '../style/theme.dart' as Theme;

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
        MaterialPageRoute(
            builder: (context) => QuestionPage(
                questions: questions, selectedQuestions: selectedQuestions)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Theme.Colors.mainPageStart,
                    Theme.Colors.mainPageEnd,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Center(
                child: RaisedButton(
              child: Text('Begin Test'),
              onPressed: () => startHandler(context),
            ))));
  }
}
