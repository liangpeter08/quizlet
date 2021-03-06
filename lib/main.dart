import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/services.dart';


import './views/mainview.dart';

void main() async {
  FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-3370394751776686~7650142851');
        SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
  return runApp(MaterialApp(
    title: 'Canadian Citizenship Test 2019',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyApp()));
}
