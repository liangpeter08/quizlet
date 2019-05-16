import 'package:flutter/material.dart';

import './enums.dart';
import './populate.dart';
import '../views/questionview.dart';
import 'package:firebase_admob/firebase_admob.dart';
import './adInfo.dart';

void startHandler(context, {skipAd}) {
  int maxRange = questions.length;
  List<int> selectedQuestions = generateQuestions(TEST_LENGTH, maxRange);
  
    if(!skipAd) {
      myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
      ).then((a) {
        return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return QuestionPage(selectedQuestions: selectedQuestions);
        }));
    });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return QuestionPage(selectedQuestions: selectedQuestions);
        }));
    }
  
}
