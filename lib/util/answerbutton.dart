import 'package:flutter/material.dart';
import 'package:new_quizlet/util/enums.dart';

class QandA extends StatelessWidget {
  final List<String> currentQuestion;
  final List<int> answerOrder;
  final Function btnHandler;
  final int selectedButton;
  final AnimationState animationState;

  QandA(
      {this.currentQuestion,
      this.answerOrder,
      this.btnHandler,
      this.selectedButton,
      this.animationState});

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
              : (this.animationState == AnimationState.SHOW_ANSWER && answerOrder[i] == 1)
                  ? Colors.green
                  : Colors.grey,
          child: Text(currentQuestion[answerOrder[i]]),
          onPressed: this.selectedButton == -1
              ? () async => await btnHandler(i, answerOrder[i])
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
