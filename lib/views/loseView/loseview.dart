import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/themeContainer.dart';
import '../loseView/exitbutton.dart';
import '../loseView/failText.dart';
import '../loseView/studyText.dart';
import '../mainView/mainView.dart';
import '../mainView/beginButton.dart';

import '../../util/starthandler.dart';
import '../../util/adInfo.dart';
import './loseAnimation.dart';

const TOTAL_MISTAKES = 5;

class LosePage extends StatefulWidget {
  final int mistakes;
  final int index;
  final String reason; //should only be 'timed' or 'mistakes'
  final String type;
  LosePage({this.mistakes, this.index, this.reason, this.type});
  @override
  State<StatefulWidget> createState() {
    return _LoseState();
  }
}

class _LoseState extends State<LosePage> with TickerProviderStateMixin {
  AnimationController fallingLeaves;
  Animation<double> animationFalling;
  bool clicked = false;

  @override
  void initState() {
    this.fallingLeaves =
        AnimationController(vsync: this, duration: new Duration(seconds: 3));
    this.fallingLeaves.forward();

    this.animationFalling =
        Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: fallingLeaves,
      curve: Curves.fastOutSlowIn,
    ));
    loadInterstitial(() {
      startHandler(context, widget.type, skipAd: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    this.fallingLeaves.dispose();
    super.dispose();
  }

  buttonOnPressed(String caller) {
    if (!clicked) {
      if(caller == 'Home') {
        Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MyApp();
          }));
        return;
      } else {
        if(!showInterstitial()) {
          startHandler(context, widget.type, skipAd: false);
        }
      }
    }
    // interstitial
    setState(() {
      clicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Column body = Column(children: <Widget>[
      Spacer(),
      StudyText(),
      Spacer(),
      FailText(
          reason: widget.reason,
          mistakes: widget.mistakes,
          index: widget.index),
      Container(padding: EdgeInsets.only(top: screenHeight / 10)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ExitButton(buttonName: 'Retry', myOnClick: buttonOnPressed),
        ExitButton(buttonName: 'Home', myOnClick: buttonOnPressed),
        BeginButton(buttonName: 'Scores', startType: 'Performance'),
      ]),
      Spacer(),
      Spacer(),
      Container(child: adBanner),
    ]);
    return LoseAnimation(
        content: ThemeBodyContainer(body),
        fallingLeaves: fallingLeaves,
        animationFalling: animationFalling);
  }
}
