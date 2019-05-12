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
    double screenHeight = MediaQuery.of(context).size.height;
    List<Widget> questionAndAnswer = new List<Widget>.generate(4, (i) {
      return Center(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
            child: MaterialButton(
          color: this.selectedButton == i
              ? answerOrder[i] == 1 ? Colors.green : Colors.red
              : (this.animationState == AnimationState.SHOW_ANSWER &&
                      answerOrder[i] == 1)
                  ? Colors.green
                  : Color(0xFFFFFFFFF),
          elevation: 4.0,
          splashColor: Color(0xFFff9999),
          child: Text(currentQuestion[answerOrder[i]],
              style: TextStyle(
                  color: Color(0xFFff4d4d), fontWeight: FontWeight.bold)),
          onPressed: this.selectedButton == -1
              ? () async => await btnHandler(i, answerOrder[i])
              : () {},
        )),
      );
    });

    Column mutatedButtons = Column(children: <Widget>[
Center(
          widthFactor: 1,
          heightFactor: 1,
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(currentQuestion[0],
                    style: TextStyle(
                        fontFamily: 'font2',
                        color: Color(0xFFFFFFFF),
                        fontSize: 30))),
            Container(margin: EdgeInsets.only(top: screenHeight / 20)),
          ])),
      Row(children: <Widget>[questionAndAnswer[0], questionAndAnswer[1]]),
      Row(children: <Widget>[questionAndAnswer[2], questionAndAnswer[3]])
    ]);

    return mutatedButtons;
  }
}
