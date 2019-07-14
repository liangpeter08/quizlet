import 'package:flutter/material.dart';
import '../../util/enums.dart';

class WinText extends StatelessWidget {
  final int mistakes;
  const WinText(this.mistakes);

  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: screenHeight * 0.04),
      child: Text(
          'Your score was ${(PASSING_GRADE - this.mistakes)} out of 20. Keep Studying! Remember, practice makes perfect!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'font2',
              color: Color(0xFFFFFFFF),
              fontSize: 22)),
    );
  }
}