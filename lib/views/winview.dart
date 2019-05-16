import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

import '../util/starthandler.dart';
import '../util/enums.dart';
import '../util/adInfo.dart';
import 'package:firebase_admob/firebase_admob.dart';

class WinPage extends StatelessWidget {
  final int mistakes;

  @override
  WinPage({this.mistakes});

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
              child: Text('Your score was ${(PASSING_GRADE - mistakes)} out of 20. Keep Studying! Remember, practice makes perfect!',
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
                        color: Color(0xFFff4d4d), fontWeight: FontWeight.bold)),
                onPressed: () => startHandler(context, skipAd: false),) 
          ])),
    );
  }
}
