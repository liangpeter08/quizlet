import 'package:flutter/material.dart';

import '../style/theme.dart' as Theme;
import '../util/populate.dart';
import '../util/answerbutton.dart';
import '../util/enums.dart';
import './loseview.dart';

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
    await new Future.delayed(const Duration(seconds: 2));

    if (this.mistakes > 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LosePage()));
    }
    if (this.index + 1 < widget.selectedQuestions.length) {
      setState(() {
        ++this.index;
        this.selectedAnswer = -1;
        this.answerOrder = generateOrder(4);
        this.currentQuestion = questions[widget.selectedQuestions[index]];
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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: screenHeight,
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
            child: Column(children: <Widget>[
              Container(padding: EdgeInsets.only(top: screenHeight / 50)),
              Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text('Strikes: ${displayMistakes(this.mistakes)}',
                          style: TextStyle(
                              fontFamily: 'font2',
                              color: Color(0xFFFFFFFF),
                              fontSize: 30))),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.all(20.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                  'Total: ${this.index + 1}/${widget.selectedQuestions.length}',
                                  style: TextStyle(
                                      fontFamily: 'font2',
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 30))))),
                  Container(padding: EdgeInsets.only(top: screenHeight / 15)),
                ],
              ),
              QandA(
                currentQuestion: this.currentQuestion,
                answerOrder: this.answerOrder,
                btnHandler: onClick,
                selectedButton: this.selectedAnswer,
                animationState: this.animationState,
              )
            ])));
  }
}
