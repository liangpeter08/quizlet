import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  onClick(int selected) {
    print('okay' + selected.toString());
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'New York State DMV Test Prep',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text('Quizlett'),
            ),
            body: 
              ListView(children: <Widget>[
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text('Question')),
                    ),
                    Center(
                      child: Container(
                          child: RaisedButton(
                        child: Text('Answer1'),
                        onPressed: () => onClick(1),
                      )),
                    ),
                    Center(
                      child: Container(
                          child: RaisedButton(
                        child: Text('Answer2'),
                        onPressed: () => onClick(2),
                      )),
                    ),
                    Center(
                      child: Container(
                          child: RaisedButton(
                        child: Text('Answer3'),
                        onPressed: () => onClick(3),
                      )),
                    ),
                    Center(
                      child: Container(
                          child: RaisedButton(
                        child: Text('Answer4'),
                        onPressed: () => onClick(4),
                      )),
                    ),
                  ]),
                ),
                );
  }
}
