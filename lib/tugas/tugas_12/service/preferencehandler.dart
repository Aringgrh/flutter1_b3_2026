import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _keyIsLogin = "isLogin";

  static Future<void> setLogin(bool isLogin) async {
    await _prefs.setBool(_keyIsLogin, isLogin);
  }

  static Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyIsLogin, email);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyIsLogin);
  }

  static bool get isLogin {
    return _prefs.getBool(_keyIsLogin) ?? false;
  }

  static Future<void> logOut() async {
    await _prefs.remove(_keyIsLogin);
  }
}
