import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UiLanguage { japanese, nepali }

/// App-wide, persisted user preferences (UI language, font scale, speech
/// rate). Kept as a single small singleton instead of a state-management
/// package, since the app's settings surface is intentionally minimal.
class AppSettings extends ChangeNotifier {
  AppSettings._();
  static final AppSettings instance = AppSettings._();

  static const _kUiLanguage = 'ui_language';
  static const _kFontScale = 'font_scale';
  static const _kSpeechRate = 'speech_rate';
  static const _kShowSpeaker = 'show_speaker';

  UiLanguage uiLanguage = UiLanguage.japanese;
  double fontScale = 1.0;
  double speechRate = 0.42;
  bool showSpeakerButtons = true;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    uiLanguage = (prefs.getString(_kUiLanguage) == 'ne')
        ? UiLanguage.nepali
        : UiLanguage.japanese;
    fontScale = prefs.getDouble(_kFontScale) ?? 1.0;
    speechRate = prefs.getDouble(_kSpeechRate) ?? 0.42;
    showSpeakerButtons = prefs.getBool(_kShowSpeaker) ?? true;
    notifyListeners();
  }

  Future<void> setUiLanguage(UiLanguage value) async {
    uiLanguage = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kUiLanguage, value == UiLanguage.nepali ? 'ne' : 'ja');
  }

  Future<void> setFontScale(double value) async {
    fontScale = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kFontScale, value);
  }

  Future<void> setSpeechRate(double value) async {
    speechRate = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kSpeechRate, value);
  }

  Future<void> setShowSpeakerButtons(bool value) async {
    showSpeakerButtons = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kShowSpeaker, value);
  }

  /// Tiny bilingual label lookup for the handful of UI chrome strings that
  /// need to flip with the UI language toggle. Content data itself
  /// (LessonItem fields) is unaffected — it is already bilingual per item.
  String label(String ja, String ne) => uiLanguage == UiLanguage.nepali ? ne : ja;
}
