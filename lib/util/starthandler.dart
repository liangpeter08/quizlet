import 'package:flutter/material.dart';
import 'package:new_quizlet/util/adInfo.dart';
import './enums.dart';
import './readcsv.dart';
import '../views/questionview.dart';
import 'package:firebase_admob/firebase_admob.dart';

void startHandler(context, {skipAd}) {
  readcsv(mySelectedProvince).then((retVal) {
    questions = retVal;
    if (!skipAd) {
      myInterstitial()
        ..load()
        ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
        ).then((a) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return QuestionPage(skipAd: skipAd);
          }));
        });
    } else {
      Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return QuestionPage(skipAd: skipAd);
          }));
    }
  });
}
