import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/translations/localization_service.dart';

class MySharedPref {
  // Prevent creating an instance
  MySharedPref._();

  // Storage instance
  static late SharedPreferences _sharedPreferences;

  // Storing keys
  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
 static const keyToken = "token";
  /// Initialize shared preferences
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Set storage instance (for testing or mocking)
  static void setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// Set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) async {
    await _sharedPreferences.setBool(_lightThemeKey, lightTheme);
  }

  /// Get if the current theme type is light
  static bool getThemeIsLight() {
    return _sharedPreferences.getBool(_lightThemeKey) ?? true; // Default to light theme
  }

  /// Save current locale
  static Future<void> setCurrentLanguage(String languageCode) async {
    await _sharedPreferences.setString(_currentLocalKey, languageCode);
  }

  /// Get current locale
  static Locale getCurrentLocal() {
    final String? langCode = _sharedPreferences.getString(_currentLocalKey);
    // Default language is English
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode] ??
           LocalizationService.defaultLanguage;
  }

  /// Save generated FCM token
  static Future<void> setFcmToken(String token) async {
    await _sharedPreferences.setString(_fcmTokenKey, token);
  }

static Future<void> setToken(String token) async {
    await _sharedPreferences.setString(keyToken, token);
  }

  /// Get FCM token
  static String? getFcmToken() {
    return _sharedPreferences.getString(_fcmTokenKey);
  }

static String? getToken() {
    return _sharedPreferences.getString(keyToken);
  }

  /// Clear all data from shared preferences
  static Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}


