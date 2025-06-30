import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  static Future<void> saveStringPref(String prefKey, String value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(prefKey, value);
  }

  static Future<void> saveIntegerPref(String prefKey, int value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(prefKey, value);
  }

  static Future<String?> getStringPref(String prefKey) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(prefKey);
  }

  static Future<int?> getIntegerPref(String prefKey) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(prefKey);
  }
}
