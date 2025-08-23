import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class SharedPreferencesService {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Font Size preferences
  static Future<void> setFontSize(double fontSize) async {
    await _prefs?.setDouble(AppConstants.materialFontSizeKey, fontSize);
  }

  static double getFontSize() {
    return _prefs?.getDouble(AppConstants.materialFontSizeKey) ??
        AppConstants.materialFontSizeDefault;
  }

  // Reset font size to default
  static Future<void> resetFontSize() async {
    await _prefs?.remove(AppConstants.materialFontSizeKey);
  }

  // User progress preferences
  static Future<void> setUserProgress(String key, dynamic value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    }
  }

  static T? getUserProgress<T>(String key) {
    return _prefs?.get(key) as T?;
  }

  // Clear all preferences
  static Future<void> clearAll() async {
    await _prefs?.clear();
  }

  // Remove specific key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Check if key exists
  static bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }

  // Scramble completion preferences
  static Future<void> setScrambleCompleted(
    String scrambleId,
    bool isCompleted,
  ) async {
    await _prefs?.setBool('scramble_$scrambleId', isCompleted);
  }

  static bool isScrambleCompleted(String scrambleId) {
    return _prefs?.getBool('scramble_$scrambleId') ?? false;
  }

  static Future<void> clearScrambleProgress(String scrambleId) async {
    await _prefs?.remove('scramble_$scrambleId');
  }

  static Future<void> clearAllScrambleProgress() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('scramble_')) {
        await _prefs?.remove(key);
      }
    }
  }
}
