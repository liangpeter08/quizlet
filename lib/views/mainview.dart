import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_quizlet/util/enums.dart';
import '../style/theme.dart' as Themes;

import '../util/starthandler.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  String province;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Themes.Colors.mainPageStart,
                    Themes.Colors.mainPageEnd,
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
                      margin: EdgeInsets.only(top: screenHeight / 20),
                      child:  Theme(
                        data: Theme.of(context).copyWith(canvasColor: Color(0xFFff4d4d), brightness: Brightness.dark, ),
                        child: DropdownButton<String>(
                          style: TextStyle(color: Colors.white,),
                          value: this.province,
                          items: <String>[
                            'Alberta',
                            'British Columbia',
                            'Manitoba',
                            'New Brunswick',
                            'Newfoundland',
                            'Northwest Territories',
                            'Nova Scotia',
                            'Nunavut',
                            'Ontario',
                            'PEI',
                            'Quebec',
                            'Saskatchewan',
                            'Yukon'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(child: Text(value, textAlign: TextAlign.center, style: TextStyle(color: Colors.white))),
                            );
                          }).toList(),
                          onChanged: (selectedProvince) { mySelectedProvince = selectedProvince;
                            setState(() {province = selectedProvince;})
                            ;
                          },
                          hint: Text('Select a Province',style: TextStyle(color: Colors.white), textAlign: TextAlign.center, )))),
                  Container(
                      margin: EdgeInsets.only(top: screenHeight / 20),
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
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
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
