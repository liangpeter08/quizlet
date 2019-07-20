import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import '../../util/printtime.dart';
import '../../util/enums.dart';
import '../mainView/mainview.dart';


class HeaderView extends StatelessWidget {
  final String type;
  final int mistakes;
  final int time;
  final int index;
  final List<int> selectedQuestions;
  const HeaderView({this.type, this.mistakes, this.time, this.index, this.selectedQuestions});

  String displayMistakes(int mistakes) {
    if (this.type == 'Test') {
      String strikes = '';
      for (int i = 0; i < mistakes; ++i) {
        strikes += 'x';
      }
      return 'Strikes: ' + strikes;
    } else {
      return '';
    }
  }


  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
          margin: EdgeInsets.only(top: screenHeight / 30),
          child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      right: screenHeight / 60,
                      top: screenHeight / 240,
                      bottom: screenHeight / 240),
                  width: screenWidth * 0.2,
                  child: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MyApp();
                      }));
                    },
                    color: Color(0xFFFFFFFF),
                    iconSize: textSize * 1.5,
                  )),
              Container(
                  padding: EdgeInsets.only(
                      left: screenHeight / 60,
                      top: screenHeight / 240,
                      bottom: screenHeight / 240),
                  width: screenWidth * 0.30,
                  child: Text(
                    '${displayMistakes(this.mistakes)}',
                    style: TextStyle(
                        fontFamily: 'font1',
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.normal,
                        fontSize: textSize),
                    maxLines: 1,
                  )),
              Expanded(
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: screenHeight / 60,
                              right: screenHeight / 60,
                              top: screenHeight / 240,
                              bottom: screenHeight / 240),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  IconData(0xe192, fontFamily: 'MaterialIcons'),
                                  size: textSize,
                                  color: Color(0xFFFFFFFF),
                                ),
                                Text(printTime(this.time, this.type),
                                    style: TextStyle(
                                        fontFamily: 'font1',
                                        color: Color(0xFFFFFFFF),
                                        fontSize: textSize)),
                              ])))),
              Container(
                padding: EdgeInsets.only(
                    left: screenHeight / 60,
                    right: screenHeight / 60,
                    top: screenHeight / 240,
                    bottom: screenHeight / 240),
                width: screenWidth * 0.28,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                        'Total: ${this.index + 1}/${this.selectedQuestions.length}',
                        style: TextStyle(
                            fontFamily: 'font1',
                            color: Color(0xFFFFFFFF),
                            fontSize: textSize))),
              ),
              Container(padding: EdgeInsets.only(top: screenHeight / 15)),
            ],
          ));
  }
}
