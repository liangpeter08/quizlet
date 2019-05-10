import 'package:flutter/material.dart';

class QandA extends StatelessWidget {
  List<String> currentQuestion;
  List<int> answerOrder;
  var btnHandler;
  var selectedButton;


  QandA({this.currentQuestion, this.answerOrder, this.btnHandler, this.selectedButton});
  
  @override
  Widget build(BuildContext context) {
    List<Widget> questionAndAnswer = new List<Widget>.generate(4, (i) {
      return Center(
        child: Container(
            child: RaisedButton(
              color: this.selectedButton == i ? answerOrder[i] == 1 ? Colors.green: Colors.red : Colors.grey,
          child: Text(currentQuestion[answerOrder[i]]),
          onPressed: () => btnHandler(i),
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
