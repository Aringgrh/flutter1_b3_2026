import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _keyIsLogin = "isLogin";
  static const _keyUserEmail = "userEmail";
<<<<<<< HEAD
=======
  static const _keyUserProfileImage = "userProfileImage";
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a

  static Future<void> setLogin(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLogin, isLogin);
  }

  static Future<void> setUserEmail(String email) async {
<<<<<<< HEAD
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserEmail, email);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserEmail);
=======
    await _prefs.setString(_keyUserEmail, email);
  }

  static String? getUserEmail() {
    return _prefs.getString(_keyUserEmail);
  }

  static Future<void> setUserProfileImage(String path) async {
    await _prefs.setString(_keyUserProfileImage, path);
  }

  static String? getUserProfileImage() {
    return _prefs.getString(_keyUserProfileImage);
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
  }

  static bool get isLogin {
    try {
      return _prefs.getBool(_keyIsLogin) ?? false;
    } catch (_) {
      return false;
    }
  }

  static Future<void> logOut() async {
<<<<<<< HEAD
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLogin);
    await prefs.remove(_keyUserEmail);
=======
    await _prefs.remove(_keyIsLogin);
    await _prefs.remove(_keyUserEmail);
    await _prefs.remove(_keyUserProfileImage);
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
  }
}
