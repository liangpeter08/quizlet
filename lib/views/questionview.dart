import 'package:flutter/material.dart';

import '../util/populate.dart';
import '../util/answerbutton.dart';
import '../util/enums.dart';

class QuestionPage extends StatefulWidget {
  // This widget is the root of your application.
  final List<int> selectedQuestions;

  QuestionPage({this.selectedQuestions});
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionPage> {
  int index;
  int mistakes;
  int selectedAnswer;
  List<int> answerOrder;
  List<String> currentQuestion;
  AnimationState animationState;

  @override
  void initState() {
    this.index = 0;
    this.mistakes = 0;
    this.selectedAnswer = -1;
    this.animationState = AnimationState.DEFAULT_STATE;
    this.answerOrder = generateOrder(4);
    this.currentQuestion = questions[widget.selectedQuestions[index]];
    super.initState();
  }

  onClick(int selected, int csvColNum) async {
    setState(() {
      this.selectedAnswer = selected;
    });
    await new Future.delayed(const Duration(seconds: 1));
    if (csvColNum != 1) {
      setState(() {
        this.animationState = AnimationState.SHOW_ANSWER;
        ++this.mistakes;
      });
    }
    await new Future.delayed(const Duration(seconds: 3));

    if (this.index + 1 < widget.selectedQuestions.length) {
      setState(() {
        ++this.index;
        this.selectedAnswer = -1;
        this.answerOrder = generateOrder(4);
        this.currentQuestion =
            questions[widget.selectedQuestions[index]];
        this.animationState = AnimationState.DEFAULT_STATE;
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
              Container(margin: EdgeInsets.all(20.0), child: Text('Strikes: ${displayMistakes(this.mistakes)}', style: TextStyle(fontSize: 20.0))),
              Expanded(child: Container(margin: EdgeInsets.all(20.0), child: Align(
                  alignment: Alignment.topRight,
                  child: Text('Total: ${this.index + 1}/${widget.selectedQuestions.length}', style: TextStyle(fontSize: 20.0)))))
            ],
          ),
          QandA(
            currentQuestion: this.currentQuestion,
            answerOrder: this.answerOrder,
            btnHandler: onClick,
            selectedButton: this.selectedAnswer,
            animationState: this.animationState,
          )
        ]));
  }
}
