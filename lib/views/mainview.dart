import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_quizlet/util/enums.dart';
import '../components/themeContainer.dart';

import '../util/starthandler.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  String province;
  double screenHeight;
  double screenWidth;
  Container title;
  Container provinceSelect;
  Expanded logo;
  Container quizButton;
  Container practiceButton;

  @override
  void initState() {
    super.initState();
  }

  void initializeContent(BuildContext context) {
    title = Container(
        margin: EdgeInsets.only(top: screenHeight / 30),
        child: Text(
          'Canadian Citizenship',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'font2', color: Color(0xFFFFFFFF), fontSize: 30),
        ));

    DropdownButton<String> pronvinceOptions = DropdownButton<String>(
        style: TextStyle(
          color: Colors.white,
        ),
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
            child: Center(
                child: Text(value,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white))),
          );
        }).toList(),
        onChanged: (selectedProvince) {
          mySelectedProvince = selectedProvince;
          setState(() {
            province = selectedProvince;
          });
        },
        hint: Text(
          'Select a Province',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ));

    provinceSelect = Container(
        margin: EdgeInsets.only(top: screenHeight / 20),
        child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Color(0xFFff4d4d), brightness: Brightness.dark),
            child: pronvinceOptions));

    this.logo = Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 10),
            //color: Color(0xFFFFFF00),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Container(
                    //color: Color(0xFF00FF00),
                    child: Image.asset('assets/logo7medium.png', width: 50.0)),
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
            ])));

    this.quizButton = Container(
        margin: EdgeInsets.only(top: screenHeight / 20),
        child: ButtonTheme(
            child: MaterialButton(
          minWidth: screenWidth / 4,
          color: Color(0xFFFFFFFFF),
          elevation: 4.0,
          splashColor: Color(0xFFff9999),
          child: Text('Begin Test',
              style: TextStyle(
                  color: Color(0xFFff4d4d), fontWeight: FontWeight.bold)),
          onPressed: () => startHandler(context, 'Test', skipAd: true),
        )));

    this.practiceButton =  Container(
              margin: EdgeInsets.only(top: screenHeight / 100),
              child: ButtonTheme(
                  minWidth: screenWidth / 4,
                  child: MaterialButton(
                    color: Color(0xFFFFFFFFF),
                    elevation: 4.0,
                    splashColor: Color(0xFFff9999),
                    child: Text('Practice',
                        style: TextStyle(
                            color: Color(0xFFff4d4d),
                            fontWeight: FontWeight.bold)),
                    onPressed: () =>
                        startHandler(context, 'Practice', skipAd: true),
                  )));
  }

  Widget build(BuildContext context) {
    this.screenHeight = MediaQuery.of(context).size.height;
    this.screenWidth = MediaQuery.of(context).size.width;
    setTextSize(screenWidth, screenHeight);
    initializeContent(context);

    Column bodyWrapper = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: (screenHeight / 5) - (screenHeight / 25)),
          Image.asset('assets/mapleleaf.png', height: screenHeight / 5),
          this.title,
          this.provinceSelect,
          this.quizButton,
          this.practiceButton,
          this.logo,
        ]);

    return themeContainer(body: bodyWrapper, context: context);
  }
}
