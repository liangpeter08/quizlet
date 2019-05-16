import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:firebase_admob/firebase_admob.dart';

import '../style/theme.dart' as Theme;
import '../util/populate.dart';
import '../util/answerbutton.dart';
import '../util/printtime.dart';
import '../util/enums.dart';
import './winview.dart';
import './loseview.dart';
import '../util/adInfo.dart';

class QuestionPage extends StatefulWidget {
  // This widget is the root of your application.
  final List<int> selectedQuestions;

  QuestionPage({this.selectedQuestions});
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionPage> with TickerProviderStateMixin {
  int index;
  int mistakes;
  int selectedAnswer;
  int time;
  Timer timer;
  List<int> answerOrder;
  List<String> currentQuestion;
  AnimationState animationState;
  AnimationController fadeAnimationController;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    this.timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (this.time < 1) {
                this.timer.cancel();
                //TO DO: go to end page when times runs out. See if user passes or fails
                if (((index - mistakes) / PASSING_GRADE).toDouble() > PASSING_PERCENTAGE) {
                  //win scenario
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WinPage(mistakes: this.mistakes)));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LosePage(mistakes: this.mistakes, index:this.index, reason:'timed out',)));
                }
              } else {
                this.time = time - 1;
              }
            }));
  }

  @override
  void initState() {
    this.index = 0;
    this.mistakes = 0;
    this.selectedAnswer = -1;
    this.time = TEST_TIME_LIMIT;
    this.animationState = AnimationState.DEFAULT_STATE;
    this.answerOrder = generateOrder(4);
    this.currentQuestion = questions[widget.selectedQuestions[index]];
    this.fadeAnimationController =
        AnimationController(vsync: this, duration: new Duration(seconds: 1));
    this.fadeAnimationController.forward();
    this.startTimer();
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-3370394751776686~7650142851');
    super.initState();
  }

  void dispose() {
    this.timer.cancel();
    this.fadeAnimationController.dispose();
    super.dispose();
  }

  onClick(int selected, int csvColNum) async {
    setState(() {
      this.selectedAnswer = selected;
    });
    // await new Future.delayed(const Duration(seconds: 1));
    if (csvColNum != 1) {
      setState(() {
        this.animationState = AnimationState.SHOW_ANSWER;
        ++this.mistakes;
      });
    }
    await new Future.delayed(const Duration(seconds: 1));
    if(!this.mounted) return;
    
    if (this.mistakes == 5) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LosePage(mistakes: this.mistakes, index:this.index, reason: 'mistakes')));
    }
    if (this.index + 1 < widget.selectedQuestions.length) {
      setState(() {
        ++this.index;
        this.selectedAnswer = -1;
        this.answerOrder = generateOrder(4);
        this.currentQuestion = questions[widget.selectedQuestions[index]];
        this.animationState = AnimationState.DEFAULT_STATE;
      });
      // this.fadeAnimationController.forward();
      if (this.fadeAnimationController != null) {
        this.fadeAnimationController.reset();
        // await new Future.delayed(const Duration(seconds: 1));
        this.fadeAnimationController.forward();
      }
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

    myBanner
    ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 0.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );

    return Scaffold(
        body: Container(
            width: screenWidth,
            height: screenHeight,
            padding: EdgeInsets.only(bottom: 50),
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
                                  fontSize: 16), maxLines: 1,)),
                      Expanded(
                          child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(screenHeight / 80),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          IconData(0xe192,
                                              fontFamily: 'MaterialIcons'),
                                          color: Color(0xFFFFFFFF),
                                        ),
                                        Text(printTime(this.time),
                                            style: TextStyle(
                                                fontFamily: 'font1',
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 16)),
                                      ])))),
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
                        animationController: this.fadeAnimationController,
                      )))
            ])));
  }
}
