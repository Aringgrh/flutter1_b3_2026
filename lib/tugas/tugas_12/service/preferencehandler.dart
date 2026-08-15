import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _keyIsLogin = "isLogin";
  static const _keyUserEmail = "userEmail";

  static Future<void> setLogin(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLogin, isLogin);
  }

  static Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserEmail, email);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserEmail);
  }

  static bool get isLogin {
    try {
      return _prefs.getBool(_keyIsLogin) ?? false;
    } catch (_) {
      return false;
    }
  }

  static Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLogin);
    await prefs.remove(_keyUserEmail);
  }
}
