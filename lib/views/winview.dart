import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

import '../util/starthandler.dart';
import '../util/enums.dart';

class WinPage extends StatefulWidget {
  final int mistakes;
  WinPage({this.mistakes});
  @override
  State<StatefulWidget> createState() {
    return _WinState();
  }
}

class _WinState extends State<WinPage> with TickerProviderStateMixin {
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

  void testFunction() {
    fallingLeaves.reset();
    fallingLeaves.forward();
  }

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
                    child: Text('You\'ve Passed!',
                        style: TextStyle(
                            fontFamily: 'font2',
                            color: Color(0xFFFFFFFF),
                            fontSize: 30)),
                  ),
                  Container(padding: EdgeInsets.only(top: screenHeight / 10)),
                  Container(
                    child: Text(
                        'Your score was ${(PASSING_GRADE - widget.mistakes)} out of 20. Keep Studying! Remember, practice makes perfect!',
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
                    onPressed: () => startHandler(context, 'Practice', skipAd: false),
                  ),             MaterialButton(
                    color: Color(0xFFFFFFFFF),
                    elevation: 4.0,
                    splashColor: Color(0xFFff9999),
                    child: Text('Test',
                        style: TextStyle(
                            color: Color(0xFFff4d4d),
                            fontWeight: FontWeight.bold)),
                    onPressed: () => testFunction()),
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
