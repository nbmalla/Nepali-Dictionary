import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Tracks which flashcards the learner has marked "known", per category.
/// Persisted locally (no backend) as a flat set of "categoryId::index" keys.
class ProgressStore extends ChangeNotifier {
  ProgressStore._();
  static final ProgressStore instance = ProgressStore._();

  static const _kKnownItems = 'known_items';

  final Set<String> _known = {};
  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _known.addAll(prefs.getStringList(_kKnownItems) ?? const []);
    _loaded = true;
    notifyListeners();
  }

  String _key(String categoryId, int index) => '$categoryId::$index';

  bool isKnown(String categoryId, int index) => _known.contains(_key(categoryId, index));

  int knownCountFor(String categoryId, int itemCount) {
    var count = 0;
    for (var i = 0; i < itemCount; i++) {
      if (isKnown(categoryId, i)) count++;
    }
    return count;
  }

  Future<void> toggle(String categoryId, int index) async {
    final key = _key(categoryId, index);
    if (_known.contains(key)) {
      _known.remove(key);
    } else {
      _known.add(key);
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kKnownItems, _known.toList());
  }

  Future<void> markKnown(String categoryId, int index) async {
    final key = _key(categoryId, index);
    if (_known.add(key)) {
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_kKnownItems, _known.toList());
    }
  }
}
