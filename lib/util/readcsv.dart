import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<List<List<String>>> readcsv(String province) async {
  String a = await rootBundle.loadString('assets/${province.replaceFirst(' ', '')}.csv');
  print(province);
  List<String> questions = a.split('\n');
  List<List<String>> items = questions.map((questions) => questions.split('*!*')).toList();
  return items;
}