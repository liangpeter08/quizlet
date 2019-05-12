import 'package:flutter/material.dart';


import './enums.dart';
import './populate.dart';
import '../views/questionview.dart';

void startHandler(context) {
    int maxRange = questions.length;
    List<int> selectedQuestions = generateQuestions(TEST_LENGTH, maxRange);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                QuestionPage(selectedQuestions: selectedQuestions)));
  }