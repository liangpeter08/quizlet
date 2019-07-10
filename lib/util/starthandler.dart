import 'package:flutter/material.dart';
import './enums.dart';
import './readcsv.dart';
import '../views/questionview.dart';

void startHandler(context, String type, {skipAd}) {
  readcsv(mySelectedProvince).then((retVal) {
    questions = retVal;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return QuestionPage(skipAd: skipAd, type: type);
    }));
  });
}
