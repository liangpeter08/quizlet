import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

import './mainview.dart';
import '../util/starthandler.dart';
import '../util/adInfo.dart';
import '../util/enums.dart';

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

  homeButton() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MyApp();
    }));
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
                  Spacer(),
                  Container(
                    child: Text('Let\'s Study Harder!',
                        style: TextStyle(
                            fontFamily: 'font2',
                            color: Color(0xFFFFFFFF),
                            fontSize: 30)),
                  ),
                  Spacer(),
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
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        child: MaterialButton(
                            color: Color(0xFFFFFFFFF),
                            elevation: 4.0,
                            splashColor: Color(0xFFff9999),
                            child: Text('Retry',
                                style: TextStyle(
                                    color: Color(0xFFff4d4d),
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              if (!clicked) {
                                if(!showInterstitial()) {
                                   startHandler(context, widget.type, skipAd: false);
                              }
                                }
                                // interstitial
        
                              setState(() {
                                clicked = true;
                              });
                            })),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: MaterialButton(
                            color: Color(0xFFFFFFFFF),
                            elevation: 4.0,
                            splashColor: Color(0xFFff9999),
                            child: Text('Home',
                                style: TextStyle(
                                    color: Color(0xFFff4d4d),
                                    fontWeight: FontWeight.bold)),
                            onPressed: homeButton))
                  ]),
                  Spacer(),
                  Spacer(),
                  Container(child: adBanner),
                ])),
            Transform(
                transform: Matrix4.translationValues(
                    0.0, animationFalling.value * screenHeight, 0.0),
                child: Container(
                    margin: EdgeInsets.only(bottom: 70),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset('assets/mapleleaf.png',
                                height: screenHeight / 7),
                            Image.asset('assets/mapleleaf.png',
                                height: screenHeight / 7),
                            Image.asset('assets/mapleleaf.png',
                                height: screenHeight / 7)
                          ],
                        )))),
          ]));
        });
  }
}
