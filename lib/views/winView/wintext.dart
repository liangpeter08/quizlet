import 'package:flutter/material.dart';

class WinText extends StatelessWidget {
  final int mistakes;
  final int index; // total questions
  const WinText(this.mistakes, this.index);

  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: screenHeight * 0.04),
      child: Text(
          'Your score was ${(this.index + 1 - this.mistakes)} out of ${this.index + 1}. Keep Studying! Remember, practice makes perfect!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'font2',
              color: Color(0xFFFFFFFF),
              fontSize: 22)),
    );
  }
}