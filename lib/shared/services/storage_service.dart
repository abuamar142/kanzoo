import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userNameKey = 'user_name';
  static const String _userClassKey = 'user_class';
  static const String _isLoggedInKey = 'is_logged_in';

  static Future<bool> saveUserData({
    required String name,
    required String className,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userNameKey, name);
      await prefs.setString(_userClassKey, className);
      await prefs.setBool(_isLoggedInKey, true);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<String, String?>> getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return {
        'name': prefs.getString(_userNameKey),
        'class': prefs.getString(_userClassKey),
      };
    } catch (e) {
      return {'name': null, 'class': null};
    }
  }

  static Future<bool> isUserLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isLoggedInKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getUserName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_userNameKey);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getUserClass() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_userClassKey);
    } catch (e) {
      return null;
    }
  }

  static Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userNameKey);
      await prefs.remove(_userClassKey);
      await prefs.setBool(_isLoggedInKey, false);
    } catch (e) {
      // Handle error
    }
  }
}
