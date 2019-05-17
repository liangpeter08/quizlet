import 'package:flutter/material.dart';

import '../views/questionview.dart';


void startHandler(context, {skipAd}) {
  
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return QuestionPage(skipAd: skipAd);
        }));
  
}
