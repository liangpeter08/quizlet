import 'package:flutter/material.dart';

class LoseAnimation extends StatelessWidget {
  final Widget content;
  final AnimationController fallingLeaves;
  final Animation<double> animationFalling;
  const LoseAnimation({this.content, this.fallingLeaves, this.animationFalling});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: fallingLeaves,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Stack(children: [content,
            Transform(
                transform: Matrix4.translationValues(
                    0.0, this.animationFalling.value * screenHeight, 0.0),
                child: Container(
                    margin: EdgeInsets.only(bottom: 70),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset('assets/mapleleaf.png',
                                height: screenHeight / 7),
                            Image.asset('assets/mapleleaf.png',
                                height: screenHeight / 7),
                            Image.asset('assets/mapleleaf.png',
                                height: screenHeight / 7)
                          ],
                        )))),
          ]));
        });
  }
}
