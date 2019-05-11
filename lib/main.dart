import 'package:flutter/material.dart';

import './util/readcsv.dart';
import './views/mainview.dart';
import './util/enums.dart';

void main() async {
  questions = await readcsv();
  return runApp(MaterialApp(
    title: 'New York State DMV Test Prep',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyApp()));
}
