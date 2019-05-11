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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo7medium.png', width: 200.0),
                  Text(
                    'Canadian Citizenship',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 60),
                      child: MaterialButton(
                        color: Color(0xFFFFFFFFF),
                        elevation: 4.0,
                        splashColor: Color(0xFFff9999),
                        child: Text('Begin Test', style: TextStyle(color: Color(0xFFff4d4d), fontWeight: FontWeight.bold)),
                        onPressed: () => startHandler(context),
                      )),
                ])));
  }
}
