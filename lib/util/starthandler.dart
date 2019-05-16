import 'package:flutter/material.dart';

import './enums.dart';
import './populate.dart';
import '../views/questionview.dart';

void startHandler(context, {skipAd}) {
  int maxRange = questions.length;
  List<int> selectedQuestions = generateQuestions(TEST_LENGTH, maxRange);
  
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return QuestionPage(selectedQuestions: selectedQuestions, skipAd: skipAd);
        }));
  
}
