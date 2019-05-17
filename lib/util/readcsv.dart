import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<List<List<String>>> readcsv() async {
  String a = await rootBundle.loadString('assets/quiz.csv');
  List<String> questions = a.split('\n');
  List<List<String>> items = questions.map((questions) => questions.split('*!*')).toList();
  return items;
}