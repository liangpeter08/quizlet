import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:better_moment/better_moment.dart';
import 'dart:async';

import '../style/theme.dart' as Theme;
import '../util/populate.dart';
import '../util/answerbutton.dart';
import '../util/enums.dart';
import './winview.dart';
import './loseview.dart';

class QuestionPage extends StatefulWidget {
  // This widget is the root of your application.
  final List<int> selectedQuestions;
  Timer timer;

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
  Moment time;
  List<int> answerOrder;
  List<String> currentQuestion;
  AnimationState animationState;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    print('here');
    print(Moment().from(this.time));
    widget.timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (0 < 1) {
                print(Moment().from(this.time));
                widget.timer.cancel();
              } else {
                //this.time = time - 1;
                print('hi');
              }
            }));
  }

  @override
  void initState() {
    this.index = 0;
    this.mistakes = 0;
    this.selectedAnswer = -1;
    this.time = Moment();
    this.animationState = AnimationState.DEFAULT_STATE;
    this.answerOrder = generateOrder(4);
    this.currentQuestion = questions[widget.selectedQuestions[index]];
    this.startTimer();
    super.initState();
  }

  void dispose() {
    widget.timer.cancel();
    super.dispose();
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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LosePage(mistakes: this.mistakes)));
    }
    if (this.index + 1 < widget.selectedQuestions.length) {
      setState(() {
        ++this.index;
        this.selectedAnswer = -1;
        this.answerOrder = generateOrder(4);
        this.currentQuestion = questions[widget.selectedQuestions[index]];
        this.animationState = AnimationState.DEFAULT_STATE;
      });
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => WinPage(mistakes: this.mistakes)));
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
            width: screenWidth,
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
              Container(
                  margin: EdgeInsets.only(top: screenHeight / 30),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(screenHeight / 40),
                          width: screenWidth * 0.34,
                          child: Text(
                              'Strikes: ${displayMistakes(this.mistakes)}',
                              style: TextStyle(
                                  fontFamily: 'font1',
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16))),
                      Expanded(
                          child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(screenHeight / 40),
                                  child: Text('yolo',
                                      style: TextStyle(
                                          fontFamily: 'font1',
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 16))))),
                      Container(
                          padding: EdgeInsets.all(screenHeight / 40),
                          width: screenWidth * 0.34,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                  'Total: ${this.index + 1}/${widget.selectedQuestions.length}',
                                  style: TextStyle(
                                      fontFamily: 'font1',
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 16)))),
                      Container(
                          padding: EdgeInsets.only(top: screenHeight / 15)),
                    ],
                  )),
              Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: QandA(
                        currentQuestion: this.currentQuestion,
                        answerOrder: this.answerOrder,
                        btnHandler: onClick,
                        selectedButton: this.selectedAnswer,
                        animationState: this.animationState,
                      )))
            ])));
  }
}
