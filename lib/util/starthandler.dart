import 'package:flutter/material.dart';
import './enums.dart';
import './readcsv.dart';
import '../views/questionview/questionview.dart';
import '../views/performance/performance.dart';

void startHandler(context, String type, {skipAd}) {
  if (type == 'Performance') {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Performance();
    }));
    return;
  }
  readcsv(mySelectedProvince).then((retVal) {
    questions = retVal;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return QuestionPage(skipAd: skipAd, type: type);
    }));
  });
}
