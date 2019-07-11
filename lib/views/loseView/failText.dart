import 'package:flutter/material.dart';
import '../loseView/loseview.dart';
import '../../util/enums.dart';

class FailText extends StatelessWidget {
  final String reason;
  final int mistakes;
  final int index;
  const FailText({this.reason, this.mistakes, this.index});

  @override
  Widget build(BuildContext context){
    return Container(
                    child: Text(
                        this.reason == 'mistakes'
                            ? 'You\'ve made ${this.mistakes} mistakes,\nthe exam only allows for ' +
                                TOTAL_MISTAKES.toString()
                            : 'Your score was ${(this.index - this.mistakes)} out of $PASSING_GRADE.\nThe required passing grade is 75%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'font2',
                            color: Color(0xFFFFFFFF),
                            fontSize: 22)),
                  );
  }
}