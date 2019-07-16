import 'package:flutter/material.dart';

class WinAnimation extends StatelessWidget {
  final Widget content;
  final AnimationController fallingLeaves;
  final Animation<double> animationFalling;
  const WinAnimation({this.content, this.fallingLeaves, this.animationFalling});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: fallingLeaves,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Stack(children: [
              content,
              FadeTransition(
                  opacity: animationFalling,
                  child: Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.083),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset('assets/mapleleaf.png',
                                  height: screenHeight * 0.45),
                            ],
                          )))),
            ]),
          );
        });
  }
}
