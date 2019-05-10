import 'package:flutter/material.dart';

import '../util/populate.dart';
import '../util/answerbutton.dart';

class QuestionPage extends StatefulWidget {
  // This widget is the root of your application.
  List<List<String>> questions;
  List<int> selectedQuestions;
  int index;
  int mistakes;
  int selectedAnswer;
  List<int> answerOrder;
  List<String> currentQuestion;

  QuestionPage(
      {this.questions,
      this.selectedQuestions,
      this.index = 0,
      this.mistakes = 0,
      this.selectedAnswer = -1}) {
    answerOrder = generateOrder(4);
    currentQuestion = this.questions[this.selectedQuestions[this.index]];
  }
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionPage> {
  onClick(int selected) {
    // print('okay' + selected.toString());
    // print(widget.questions[1][1]);
    // if (selected == 1) {

    // }

    setState(() {
      widget.selectedAnswer = selected;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Quizlett'),
        ),
        body: QandA(
            currentQuestion: widget.currentQuestion,
            answerOrder: widget.answerOrder,
            btnHandler: onClick,
            selectedButton: widget.selectedAnswer));
  }
}
