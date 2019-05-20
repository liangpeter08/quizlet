import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../style/theme.dart' as Theme;

import '../util/starthandler.dart';
import 'package:firebase_admob/firebase_admob.dart';
import '../util/adInfo.dart';
import '../util/enums.dart';

const TOTAL_MISTAKES = 5;

class LosePage extends StatefulWidget {
  final int mistakes;
  final int index;
  final String reason; //should only be 'timed' or 'mistakes'
  LosePage({this.mistakes, this.index, this.reason});
  @override
  State<StatefulWidget> createState() {
    return _LoseState();
  }
}

class _LoseState extends State<LosePage> with TickerProviderStateMixin {
  AnimationController fallingLeaves;
  Animation<double> animationFalling;

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
    super.initState();
  }

  @override
  void dispose() {
    this.fallingLeaves.dispose();
    super.dispose();
  }

  testButton() {
    this.fallingLeaves.reset();  
    this.fallingLeaves.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: fallingLeaves,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Stack(children: [
            Container(
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
                  Container(padding: EdgeInsets.only(top: screenHeight / 5)),
                  Container(
                    child: Text('Let\'s Study Harder!',
                        style: TextStyle(
                            fontFamily: 'font2',
                            color: Color(0xFFFFFFFF),
                            fontSize: 30)),
                  ),
                  Container(padding: EdgeInsets.only(top: screenHeight / 10)),
                  Container(
                    child: Text(
                        widget.reason == 'mistakes'
                            ? 'You\'ve made ${widget.mistakes} mistakes,\nthe exam only allows for ' +
                                TOTAL_MISTAKES.toString()
                            : 'Your score was ${(widget.index - widget.mistakes)} out of $PASSING_GRADE.\nThe required passing grade is 75%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'font2',
                            color: Color(0xFFFFFFFF),
                            fontSize: 22)),
                  ),
                  Container(padding: EdgeInsets.only(top: screenHeight / 10)),
                  MaterialButton(
                      color: Color(0xFFFFFFFFF),
                      elevation: 4.0,
                      splashColor: Color(0xFFff9999),
                      child: Text('Retry',
                          style: TextStyle(
                              color: Color(0xFFff4d4d),
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        startHandler(context, skipAd: false);
                      }),
                                        MaterialButton(
                      color: Color(0xFFFFFFFFF),
                      elevation: 4.0,
                      splashColor: Color(0xFFff9999),
                      child: Text('TestButton',
                          style: TextStyle(
                              color: Color(0xFFff4d4d),
                              fontWeight: FontWeight.bold)),
                      onPressed: testButton)
                ])),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, animationFalling.value * 1000, 0.0),
              child: Align(alignment: Alignment.bottomCenter,child:Row(children: <Widget>[
              Image.asset('assets/mapleleaf.png', height: screenHeight / 5),
              Image.asset('assets/mapleleaf.png', height: screenHeight / 5),
              Image.asset('assets/mapleleaf.png', height: screenHeight / 5)
              ],))
              
              ),
          ]));
        });
  }
}
