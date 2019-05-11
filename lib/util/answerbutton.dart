import 'package:flutter/material.dart';

class QandA extends StatelessWidget {
  List<String> currentQuestion;
  List<int> answerOrder;
  var btnHandler;
  var selectedButton;
  bool showCorrect;

  QandA(
      {this.currentQuestion,
      this.answerOrder,
      this.btnHandler,
      this.selectedButton,
      this.showCorrect = false});

  @override
  Widget build(BuildContext context) {
    List<Widget> questionAndAnswer = new List<Widget>.generate(4, (i) {
      return Center(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
            child: RaisedButton(
          color: this.selectedButton == i
              ? answerOrder[i] == 1 ? Colors.green : Colors.red
              : (this.showCorrect && answerOrder[i] == 1)
                  ? Colors.green
                  : Colors.grey,
          child: Text(currentQuestion[answerOrder[i]]),
          onPressed: this.selectedButton == -1
              ? () => btnHandler(i, answerOrder[i])
              : () {},
        )),
      );
    });

    questionAndAnswer.insert(
        0,
        Center(widthFactor: 1, heightFactor: 1,
          child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(currentQuestion[0])),
        ));
    return Column(children: questionAndAnswer);
  }
}
