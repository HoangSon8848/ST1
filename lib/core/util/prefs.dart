import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static checkValueKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(key);
  }

  static setIntValue(String key, int n) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, n);
  }

  static getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static setStringValue(String key, String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, s);
  }

  static getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static removeStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static setBooleanValue(String key, bool b) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, b);
  }

  static getBooleanValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
