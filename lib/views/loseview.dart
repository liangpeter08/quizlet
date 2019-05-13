import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

import '../util/starthandler.dart';

const TOTAL_MISTAKES = 5;

class LosePage extends StatelessWidget {
  final int mistakes;
  LosePage({this.mistakes});
  @override
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
              child: Text('Let\'s Study Harder!',
                  style: TextStyle(
                      fontFamily: 'font2',
                      color: Color(0xFFFFFFFF),
                      fontSize: 30)),
            ),
            Container(padding: EdgeInsets.only(top: screenHeight / 10)),
            Container(
              child: Text('You\'ve made ${this.mistakes} mistakes,\nthe exam only allows for ' + TOTAL_MISTAKES.toString(),
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
                onPressed: () => startHandler(context))
          ])),
    );
  }
}
