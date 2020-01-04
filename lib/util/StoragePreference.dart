import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePreference {

  static final String _scores = "score";
  static final String _region = "region";

  static getScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_scores) ?? new List<String>();
  }

  static Future<bool> setScore(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> values = prefs.getStringList(_scores) ?? new List<String>();
    values.add(value);
    return prefs.setStringList(_scores, values);
  }

    static getRegion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_region);
  }

  static Future<bool> setRegion(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_region, value);
  }
}