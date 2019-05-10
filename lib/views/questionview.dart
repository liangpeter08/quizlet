import 'package:flutter/material.dart';

import '../util/populate.dart';
import '../util/answerbutton.dart';

class QuestionPage extends StatefulWidget {
  // This widget is the root of your application.
  List<List<String>> questions;
  List<int> selectedQuestions;
  int index;
  int mistakes;

  QuestionPage(
      {this.questions,
      this.selectedQuestions,
      this.index = 0,
      this.mistakes = 0});
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionPage> {


  Widget build(BuildContext context) {
    List<int> answerOrder = generateOrder(4);
    List<String> currentQuestion =
        widget.questions[widget.selectedQuestions[widget.index]];
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Quizlett'),
        ),
        body: QandA(currentQuestion: currentQuestion, answerOrder: answerOrder));
  }
}
