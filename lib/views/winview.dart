import 'package:flutter/material.dart';
import '../style/theme.dart' as Theme;

import '../util/starthandler.dart';
import '../util/enums.dart';
import '../util/adInfo.dart';

class WinPage extends StatefulWidget {
  final int mistakes;
  final String type;
  WinPage({this.mistakes, this.type});
  @override
  State<StatefulWidget> createState() {
    return _WinState();
  }
}

class _WinState extends State<WinPage> with TickerProviderStateMixin {
  AnimationController fallingLeaves;
  Animation<double> animationFalling;
  Animation colorChange;
  AnimationController colorController;
  bool clicked = false;
  @override
  void initState() {
    print('init Win state');
    this.fallingLeaves =
        AnimationController(vsync: this, duration: new Duration(seconds: 3));
    this.colorController =
        AnimationController(vsync: this, duration: new Duration(seconds: 2));
    this.colorController.forward();
    this.fallingLeaves.forward();

    this.animationFalling = CurvedAnimation(
      parent: fallingLeaves,
      curve: Curves.decelerate,
    );
    this.colorChange = ColorTween(
      begin: Colors.white,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: this.colorController,
      curve: Curves.easeIn,
    ));
    super.initState();
  }

  // void testFunction() {
  //   fallingLeaves.reset();
  //   fallingLeaves.forward();
  //   colorController.reset();
  //   colorController.forward();
  // }

  void dispose() {
    this.colorController.dispose();
    this.fallingLeaves.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: fallingLeaves,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: screenHeight,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Theme.Colors.mainPageStart,
                          Theme.Colors.mainPageEnd,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Stack(children: [
                    FadeTransition(
                        opacity: animationFalling,
                        child: Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.083),
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Image.asset('assets/mapleleaf.png',
                                        height: screenHeight * 0.45),
                                  ],
                                )))),
                    Column(children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: screenHeight * 0.27)),
                      Container(
                        alignment: Alignment.center,
                        child: Text('You\'ve\nPassed!',
                            style: TextStyle(
                                fontFamily: 'font2',
                                color: colorChange.value,
                                fontSize: 40)),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: screenHeight / 10)),
                      Container(
                        child: Text(
                            'Your score was ${(PASSING_GRADE - widget.mistakes)} out of 20. Keep Studying! Remember, practice makes perfect!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'font2',
                                color: Color(0xFFFFFFFF),
                                fontSize: 22)),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: screenHeight * 0.05)),
                      MaterialButton(
                        color: Color(0xFFFFFFFFF),
                        elevation: 4.0,
                        splashColor: Color(0xFFff9999),
                        child: Text('Retry',
                            style: TextStyle(
                                color: Color(0xFFff4d4d),
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          print('Win page retry');
                              if (!clicked) {
                                // myAd.show(
                                //   anchorType: AnchorType.bottom,
                                //   anchorOffset: 0.0,
                                // );
                                // interstitial
                                startHandler(context, widget.type,
                                    skipAd: false);
                              }
                              setState(() {
                                clicked = true;
                              });
                            },
                      ),
                      // MaterialButton(
                      //     color: Color(0xFFFFFFFFF),
                      //     elevation: 4.0,
                      //     splashColor: Color(0xFFff9999),
                      //     child: Text('Test',
                      //         style: TextStyle(
                      //             color: Color(0xFFff4d4d),
                      //             fontWeight: FontWeight.bold)),
                      //     onPressed: () => testFunction()),
                    Spacer(),
                    Container(child: adBanner),
                    ]),
                  ])));
        });
  }
}
