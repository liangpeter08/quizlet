import 'package:flutter/material.dart';
import './enums.dart';
import './readcsv.dart';
import '../views/questionview.dart';
import '../views/winview.dart';
import 'package:firebase_admob/firebase_admob.dart';

void startHandler(context, {skipAd}) {
  readcsv(mySelectedProvince).then((retVal) {
    questions = retVal;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return QuestionPage(skipAd: skipAd);
    }));
  });
}
