import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> readcsv() async {
  String a = await rootBundle.loadString('assets/quiz.csv');
  print(a);
  return a;
}