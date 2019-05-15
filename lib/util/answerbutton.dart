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
    List<Widget> questionAndAnswer = new List<Widget>.generate(4, (i) {
      return Container(
          width: MediaQuery.of(context).size.width * 80 / 100,
          // height: MediaQuery.of(context).size.height * 10 / 100,
          child:
              // FittedBox(
              //   fit: BoxFit.fitWidth,
              // child:
              Container(
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
              padding: EdgeInsets.all(screenHeight / 60),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: this.selectedButton == i
                  ? answerOrder[i] == 1 ? Color(0xFF4fca94) : Color(0xFFe598a5)
                  : (this.animationState == AnimationState.SHOW_ANSWER &&
                          answerOrder[i] == 1)
                      ? Color(0xFF4fca94)
                      : Color(0xFFf1f2f5),
              splashColor: Color(0xFFff9999),
              child: SizedBox(
                  height: screenHeight * 0.045,
                  child: Container(alignment: Alignment.center,
                  child: AutoSizeText(
                    currentQuestion[answerOrder[i]],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: TEXT_SIZE,
                        fontFamily: 'font2',
                        color: Color(0xFF3a3a3a),
                        fontWeight: FontWeight.normal),
                    maxLines: 3,
                  ))),
              onPressed: this.selectedButton == -1
                  ? () async => await btnHandler(i, answerOrder[i])
                  : () {},
            ),
            // )
          ));
    });
    // // questionAndAnswer.insert(0,Spacer());
    // questionAndAnswer.insert(
    //     0,
    //     SizedBox(
    //       width: MediaQuery.of(context).size.width * 90 / 100,
    //       child:
    //    Container(
    //         //    margin: EdgeInsets.all(screenWidth / 20),
    //             child: Text(currentQuestion[0],
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                     fontFamily: 'font2',
    //                     color: Color(0xFF3a3a3a),
    //                     fontSize: TEXT_SIZE + 10)))));
    //                          questionAndAnswer.insert(0, Spacer());
//  questionAndAnswer.add(Spacer());
    return
        // FittedBox(
        //   fit: BoxFit.fitHeight,
        //   child:
        FadeTransition(
            opacity: CurvedAnimation(
                parent: this.animationController, curve: Curves.easeOut),
            child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(children: <Widget>[
                  Spacer(),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      height: screenHeight * 0.25,
                      child: Container(
                          alignment: Alignment.center,
                          //    margin: EdgeInsets.all(screenWidth / 20),
                          child: AutoSizeText(currentQuestion[0],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'font2',
                                  color: Color(0xFF3a3a3a),
                                  fontSize: TEXT_SIZE + 10),
                                  maxLines: 3,))),
                  Spacer(),
                  Column(children: questionAndAnswer),
                  Spacer()
                ]
                    // )
                    ))
            // )
            );
  }
}
