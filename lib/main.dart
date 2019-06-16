import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/services.dart';


import './views/mainview.dart';

void main() async {
  FacebookAudienceNetwork.init(
    testingId: '746e1920-e104-4f2e-9ff7-3eb8d32f2f2b',
);
  return runApp(MaterialApp(
    title: 'Canadian Citizenship Test 2019',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyApp()));
}
