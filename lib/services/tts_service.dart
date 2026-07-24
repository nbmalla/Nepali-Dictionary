import 'package:flutter_tts/flutter_tts.dart';

/// Thin wrapper around flutter_tts, fixed to Japanese speech.
/// Nepali (meaning) playback is intentionally not offered: browser/OS
/// speech engines rarely ship a Nepali voice, so we scope this to the
/// language learners actually need spoken aloud.
class TtsService {
  TtsService._();
  static final TtsService instance = TtsService._();

  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;

  Future<void> _ensureInit() async {
    if (_initialized) return;
    await _tts.setLanguage('ja-JP');
    _initialized = true;
  }

  Future<void> speak(String text, {double rate = 0.42}) async {
    await _ensureInit();
    await _tts.setSpeechRate(rate);
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> stop() => _tts.stop();
}
