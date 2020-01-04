import 'package:flutter/material.dart';
import '../../util/starthandler.dart';

class BeginButton extends StatelessWidget {
  final String buttonName;
  final String startType;
  const BeginButton({this.buttonName, this.startType});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Container(
        padding: EdgeInsets.only(top: screenHeight / 40),
        child: ButtonTheme(
            child: MaterialButton(
          minWidth: screenWidth / 4,
          color: Color(0xFFFFFFFFF),
          elevation: 4.0,
          splashColor: Color(0xFFff9999),
          child: Text(this.buttonName,
              style: TextStyle(
                  color: Color(0xFFff4d4d), fontWeight: FontWeight.bold)),
          onPressed: () => startHandler(context, this.startType, skipAd: true),
        )));
  }
}
