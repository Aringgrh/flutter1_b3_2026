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
    await _prefs.setBool(_keyIsLogin, isLogin);
  }

  static bool get isLogin {
    return _prefs.getBool(_keyIsLogin) ?? false;
  }

  static Future<void> setUserEmail(String email) async {
    await _prefs.setString(_keyUserEmail, email);
  }

<<<<<<< HEAD
  static Future<String?> getUserEmail() async {
    return _prefs.getString(_keyUserEmail);
  }

  static Future<void> logOut() async {
    await _prefs.remove(_keyIsLogin);
    await _prefs.remove(_keyUserEmail);
=======
  static String? getUserEmail() {
    return _prefs.getString(_keyUserEmail);
  }

  static Future<void> setUserProfileImage(String path) async {
    await _prefs.setString(_keyUserProfileImage, path);
  }

  static String? getUserProfileImage() {
    return _prefs.getString(_keyUserProfileImage);
  }

  static Future<void> logOut() async {
    await _prefs.remove(_keyIsLogin);
    await _prefs.remove(_keyUserEmail);
    await _prefs.remove(_keyUserProfileImage);
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
  }
}
