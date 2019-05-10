import 'package:flutter/material.dart';

class QandA extends StatelessWidget {
  List<String> currentQuestion;
  List<int> answerOrder;

  QandA({this.currentQuestion, this.answerOrder});
  onClick(int selected) {
    // print('okay' + selected.toString());
    // print(widget.questions[1][1]);
    if (selected == 1) {
      
    }
  }
  
  @override
  Widget build(BuildContext context) {
    List<Widget> questionAndAnswer = new List<Widget>.generate(4, (i) {
      return Center(
        child: Container(
            child: RaisedButton(
          child: Text(currentQuestion[answerOrder[i]]),
          onPressed: () => onClick(answerOrder[i]),
        )),
      );
    });

    questionAndAnswer.insert(0, Center(
      child: Container(
          margin: EdgeInsets.only(top: 20.0), child: Text(currentQuestion[0])),
    ));
  return ListView(children: questionAndAnswer);
  } 
}
