import 'package:flutter/material.dart';

class QandA extends StatelessWidget {
  List<String> currentQuestion;
  List<int> answerOrder;
  var btnHandler;


  QandA({this.currentQuestion, this.answerOrder, this.btnHandler});
  
  @override
  Widget build(BuildContext context) {
    List<Widget> questionAndAnswer = new List<Widget>.generate(4, (i) {
      return Center(
        child: Container(
            child: RaisedButton(
          child: Text(currentQuestion[answerOrder[i]]),
          onPressed: () => btnHandler(answerOrder[i]),
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
