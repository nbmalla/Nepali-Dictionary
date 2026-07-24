import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'tts_service.dart';

/// Plays a recorded human-voice clip for a phrase when one has been
/// supplied at `assets/audio/<categoryId>/<index>.mp3`; otherwise falls
/// back to synthesized speech via [TtsService].
///
/// To replace a phrase's pronunciation with your own recording, drop an
/// mp3 named `<index>.mp3` into `assets/audio/<categoryId>/`, where
/// `<index>` is that item's zero-based position within its category's
/// list in lib/data/lesson_items_data.dart. No code changes needed —
/// this class checks for the file at playback time and uses it
/// automatically if present.
class AudioService {
  AudioService._();
  static final AudioService instance = AudioService._();

  final AudioPlayer _player = AudioPlayer();
  final Set<String> _knownMissing = {};

  String _assetKey(String categoryId, int index) => 'assets/audio/$categoryId/$index.mp3';

  Future<void> speak(
    String categoryId,
    int index,
    String fallbackText, {
    double rate = 0.42,
  }) async {
    final key = _assetKey(categoryId, index);
    if (!_knownMissing.contains(key)) {
      try {
        await rootBundle.load(key);
        await _player.stop();
        await _player.play(AssetSource('audio/$categoryId/$index.mp3'));
        return;
      } catch (_) {
        _knownMissing.add(key);
      }
    }
    await TtsService.instance.speak(fallbackText, rate: rate);
  }
}
