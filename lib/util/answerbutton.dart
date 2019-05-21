import 'package:flutter/material.dart';
import 'package:new_quizlet/util/enums.dart';
import 'package:auto_size_text/auto_size_text.dart';

class QandA extends StatelessWidget {
  final List<String> currentQuestion;
  final List<int> answerOrder;
  final Function btnHandler;
  final int selectedButton;
  final AnimationState animationState;
  final AnimationController animationController;

  QandA(
      {this.currentQuestion,
      this.answerOrder,
      this.btnHandler,
      this.selectedButton,
      this.animationState,
      this.animationController});
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if( this.currentQuestion.length == 0) return Container();
    List<Widget> questionAndAnswer = new List<Widget>.generate(4, (i) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        child: Container(
          width: MediaQuery.of(context).size.width * 88 / 100,
          child:
              Container(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: this.selectedButton == i
                  ? answerOrder[i] == 1 ? Color(0xFF4fca94) : Color(0xFFe598a5)
                  : (this.animationState == AnimationState.SHOW_ANSWER &&
                          answerOrder[i] == 1)
                      ? Color(0xFF4fca94)
                      : Color(0xFFf1f2f5),
              splashColor: Color(0xFFbdc3cc),
              child:  Text(
                    currentQuestion[answerOrder[i]],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: TEXT_SIZE,
                        fontFamily: 'font2',
                        color: Color(0xFF3a3a3a),
                        fontWeight: FontWeight.normal),
                  ),
              onPressed: this.selectedButton == -1
                  ? () => btnHandler(i, answerOrder[i])
                  : () {},
            ),
            // )
          )));
    });
    questionAndAnswer.insert(4, Spacer());
    questionAndAnswer.insert(3, Spacer());
        questionAndAnswer.insert(2, Spacer());
            questionAndAnswer.insert(1, Spacer());
    return
        // FittedBox(
        //   fit: BoxFit.fitHeight,
        //   child:
        FadeTransition(
            opacity: CurvedAnimation(
                parent: this.animationController, curve: Curves.easeOut),
            child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      height: screenHeight * 0.2,
                      child: Container(
                          alignment: Alignment.center,
                          //    margin: EdgeInsets.all(screenWidth / 20),
                          child: AutoSizeText(currentQuestion[0],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'font2',
                                  color: Color(0xFF3a3a3a),
                                  fontSize: TEXT_SIZE + 5),
                                  maxLines: 3,))),
                Expanded(child: Column(children: questionAndAnswer)),
                ]
                    // )
                    ))
            // )
            );
  }
}
