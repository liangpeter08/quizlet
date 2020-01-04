import 'package:flutter/material.dart';
import './winAnimation.dart';
import '../../components/themeContainer.dart';
import '../winView/wintext.dart';
import '../winView/passtext.dart';
import '../loseView/exitbutton.dart';
import '../../util/starthandler.dart';
import '../../util/adInfo.dart';
import '../mainView/mainview.dart';
import '../mainView/beginButton.dart';

class WinPage extends StatefulWidget {
  final int mistakes;
  final String type;
  final int total;
  WinPage({this.mistakes, this.type, this.total});
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
    loadInterstitial(() {
      startHandler(context, widget.type, skipAd: false);
    });
    super.initState();
  }

  void dispose() {
    this.colorController.dispose();
    this.fallingLeaves.dispose();
    super.dispose();
  }

  buttonOnPressed(String caller) {
    if (!clicked) {
      if(caller == 'Home') {
        Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MyApp();
          }));
        return;
      } else {
        if(!showInterstitial()) {
          startHandler(context, widget.type, skipAd: false);
        }
      }
    }
    // interstitial
    setState(() {
      clicked = true;
    });
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Column body = Column(children: <Widget>[
      Container(padding: EdgeInsets.only(top: screenHeight * 0.25)),
      PassText(this.colorChange),
      Container(padding: EdgeInsets.only(top: screenHeight / 10)),
      WinText(widget.mistakes, widget.total),
      Container(padding: EdgeInsets.only(top: screenHeight * 0.05)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ExitButton(buttonName: 'Retry', myOnClick: buttonOnPressed),
        ExitButton(buttonName: 'Home', myOnClick: buttonOnPressed),
        BeginButton(buttonName: 'View Scores', startType: 'Performance'),
      ]),
      Spacer(),
      Container(child: adBanner),
    ]);

    return WinAnimation(
        content: ThemeBodyContainer(body),
        fallingLeaves: fallingLeaves,
        animationFalling: animationFalling);
  }
}
