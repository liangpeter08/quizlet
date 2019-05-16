import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../style/theme.dart' as Theme;

import '../util/starthandler.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(padding: EdgeInsets.only(top: screenHeight / 5)),
                  Image.asset('assets/mapleleaf.png', height: screenHeight / 5),
                  Container(
                      margin: EdgeInsets.only(top: screenHeight / 30),
                      child: Text(
                        'Canadian Citizenship',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'font2',
                            color: Color(0xFFFFFFFF),
                            fontSize: 30),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: screenHeight / 10),
                      child: MaterialButton(
                        color: Color(0xFFFFFFFFF),
                        elevation: 4.0,
                        splashColor: Color(0xFFff9999),
                        child: Text('Begin Test',
                            style: TextStyle(
                                color: Color(0xFFff4d4d),
                                fontWeight: FontWeight.bold)),
                        onPressed: () => startHandler(context, skipAd: true),
                      )),
                  Container(padding: EdgeInsets.only(top: screenHeight / 5)),
                  Expanded(
                      child: Container(
                          //color: Color(0xFFFFFF00),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          Container(
                              //color: Color(0xFF00FF00),
                              child: Image.asset('assets/logo7medium.png',
                                  width: 50.0)),
                          Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              'Quetzal Labs',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ])
                      ])))
                ]))));
  }
}
