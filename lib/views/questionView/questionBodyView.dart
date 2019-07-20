import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class QuestionBody extends StatelessWidget {
  final Widget questions;
  const QuestionBody({this.questions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 6, bottom: 6, right: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              borderRadius: new BorderRadius.circular(20.0),
            ),
            child: this.questions));
  }
}
