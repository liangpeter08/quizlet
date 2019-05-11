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
  bool showCorrect;

  QuestionPage(
      {this.questions,
      this.selectedQuestions,
      this.index = 0,
      this.mistakes = 0,
      this.selectedAnswer = -1,
      this.showCorrect = false}) {
    answerOrder = generateOrder(4);
    currentQuestion = this.questions[this.selectedQuestions[this.index]];
  }
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionPage> {
  onClick(int selected, int csvColNum) async {
    setState(() {
      widget.selectedAnswer = selected;
    });
    await new Future.delayed(const Duration(seconds: 1));
    if (csvColNum != 1) {
      setState(() {
        widget.showCorrect = true;
        ++widget.mistakes;
      });
    }
    await new Future.delayed(const Duration(seconds: 3));

    if (widget.index + 1 < widget.selectedQuestions.length) {
      setState(() {
        ++widget.index;
        widget.selectedAnswer = -1;
        widget.answerOrder = generateOrder(4);
        widget.currentQuestion =
            widget.questions[widget.selectedQuestions[widget.index]];
        widget.showCorrect = false;
      });
    }
  }
  
  String displayMistakes(int mistakes) {
    String strikes = '';
    for (int i = 0; i < mistakes; ++i) {
      strikes += 'X';
    }
    return strikes;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Quizlett'),
        ),
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(margin: EdgeInsets.all(20.0), child: Text('Strikes: ${displayMistakes(widget.mistakes)}', style: TextStyle(fontSize: 20.0))),
              Expanded(child: Container(margin: EdgeInsets.all(20.0), child: Align(
                  alignment: Alignment.topRight,
                  child: Text('Total: ${widget.index + 1}/${widget.selectedQuestions.length}', style: TextStyle(fontSize: 20.0)))))
            ],
          ),
          QandA(
            currentQuestion: widget.currentQuestion,
            answerOrder: widget.answerOrder,
            btnHandler: onClick,
            selectedButton: widget.selectedAnswer,
            showCorrect: widget.showCorrect,
          )
        ]));
  }
}
