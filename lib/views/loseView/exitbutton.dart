import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final String buttonName;
  final Function(String) myOnClick;
  const ExitButton({this.buttonName, this.myOnClick});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: MaterialButton(
            color: Color(0xFFFFFFFFF),
            elevation: 4.0,
            splashColor: Color(0xFFff9999),
            child: Text(buttonName,
                style: TextStyle(
                    color: Color(0xFFff4d4d), fontWeight: FontWeight.bold)),
            onPressed: () => myOnClick(buttonName)));
  }
}
