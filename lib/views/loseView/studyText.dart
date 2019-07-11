import 'package:flutter/material.dart';

class StudyText extends StatelessWidget {
const StudyText();

@override
Widget build(BuildContext context){
    return Container(
                      child: Text('Let\'s Study Harder!',
                          style: TextStyle(
                              fontFamily: 'font2',
                              color: Color(0xFFFFFFFF),
                              fontSize: 30)),
                    );
  }
}
