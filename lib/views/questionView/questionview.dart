import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import '../../components/themeContainer.dart';
import '../../util/populate.dart';
import './answerbutton.dart';
import '../../util/enums.dart';
import '../winview/winview.dart';
import '../loseView/loseview.dart';
import '../../util/adInfo.dart';
import './headerView.dart';
import './questionBodyView.dart';

class QuestionPage extends StatefulWidget {
  // This widget is the root of your application.
  final bool skipAd;
  final String type;

  QuestionPage({this.skipAd, this.type});
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
  List<int> selectedQuestions;
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
                if (((index - mistakes) / PASSING_GRADE).toDouble() >
                    PASSING_PERCENTAGE) {
                  //win scenario
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WinPage(
                              mistakes: this.mistakes, type: widget.type)));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LosePage(
                                mistakes: this.mistakes,
                                index: this.index,
                                reason: 'timed out',
                                type: widget.type,
                              )));
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
    this.selectedQuestions = List<int>();
    this.currentQuestion = List<String>();
    this.time = TEST_TIME_LIMIT;
    this.animationState = AnimationState.DEFAULT_STATE;
    this.answerOrder = generateOrder(4);
    if (widget.type == 'Test') {
      this.selectedQuestions = generateQuestions(TEST_LENGTH, questions.length);
    } else if (widget.type == 'Practice') {
      this.selectedQuestions =
          List<int>.generate(questions.length, (int index) => index);
    }
    this.currentQuestion = questions[selectedQuestions[index]];

    this.fadeAnimationController =
        AnimationController(vsync: this, duration: new Duration(seconds: 1));
    this.fadeAnimationController.forward();

    this.startTimer();
    loadInterstitial(() {
      setState(() {
        ++this.index;
        this.selectedAnswer = -1;
        this.answerOrder = generateOrder(4);
        this.currentQuestion = questions[this.selectedQuestions[index]];
        this.animationState = AnimationState.DEFAULT_STATE;
      });
    });
    super.initState();
  }

  void dispose() {
    this.timer.cancel();
    this.fadeAnimationController.dispose();
    super.dispose();
  }

  onClick(int selected, int csvColNum) {
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
    Future.delayed(const Duration(seconds: 1), () {
      if (!this.mounted) return null;

      if (widget.type == 'Test' && this.mistakes == 6) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LosePage(
                      mistakes: this.mistakes,
                      index: this.index,
                      reason: 'mistakes',
                      type: widget.type,
                    )));
      }
      if (this.index + 1 < this.selectedQuestions.length) {
        if ((this.index + 1) % 12 == 0) {
          // interstitial ad
          if (showInterstitial()) {
            return null;
          }
        }
        setState(() {
          ++this.index;
          this.selectedAnswer = -1;
          this.answerOrder = generateOrder(4);
          this.currentQuestion = questions[this.selectedQuestions[index]];
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
                builder: (context) =>
                    WinPage(mistakes: this.mistakes, type: widget.type)));
      }
    });
  }

  Widget build(BuildContext context) {
    return ThemeBodyContainer(Column(children: <Widget>[
      HeaderView(
          index: this.index,
          time: this.time,
          selectedQuestions: this.selectedQuestions,
          mistakes: this.mistakes,
          type: widget.type),
      QuestionBody(
          questions: QandA(
        currentQuestion: this.currentQuestion,
        answerOrder: this.answerOrder,
        btnHandler: onClick,
        selectedButton: this.selectedAnswer,
        animationState: this.animationState,
        animationController: this.fadeAnimationController,
      )),
      Container(child: adBanner),
    ]));
  }
}
