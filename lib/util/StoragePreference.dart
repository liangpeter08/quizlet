import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePreference {

  static final String _scores = "score";

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static getScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_scores) ?? new List<String>();
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setScore(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> values = prefs.getStringList(_scores) ?? new List<String>();
    values.add(value);
    return prefs.setStringList(_scores, values);
  }
}