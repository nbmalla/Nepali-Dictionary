import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../services/audio_service.dart';
import '../state/app_settings.dart';
import '../theme/app_theme.dart';

/// "きく" mode: passive, sequential listening. Both the phrase and its
/// meaning are shown at once (no quizzing) — the point is repeated
/// listening exposure, with autoplay stepping through the deck.
class ListenModeScreen extends StatefulWidget {
  final String categoryId;
  const ListenModeScreen({super.key, required this.categoryId});

  @override
  State<ListenModeScreen> createState() => _ListenModeScreenState();
}

class _ListenModeScreenState extends State<ListenModeScreen> {
  late final List<int> _indices;
  late final List<LessonItem> _allItems;
  int _pos = 0;
  bool _autoplay = true;

  @override
  void initState() {
    super.initState();
    _allItems = lessonItemsByCategory[widget.categoryId] ?? const <LessonItem>[];
    _indices = [
      for (var i = 0; i < _allItems.length; i++)
        if (_allItems[i].kind == ContentKind.phrase) i,
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) => _speakCurrent());
  }

  LessonItem? get _current => _indices.isEmpty ? null : _allItems[_indices[_pos]];

  Future<void> _speakCurrent() async {
    final item = _current;
    if (item == null) return;
    await AudioService.instance.speak(
      widget.categoryId,
      _indices[_pos],
      item.primary,
      rate: AppSettings.instance.speechRate,
    );
  }

  void _next() {
    if (_pos >= _indices.length - 1) return;
    setState(() => _pos++);
    if (_autoplay) _speakCurrent();
  }

  void _prev() {
    if (_pos <= 0) return;
    setState(() => _pos--);
    if (_autoplay) _speakCurrent();
  }

  @override
  Widget build(BuildContext context) {
    final category = lessonCategories.firstWhere((c) => c.id == widget.categoryId);
    final item = _current;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: Text('きく: ${category.jpLabel}'),
        actions: [
          IconButton(
            icon: Icon(_autoplay ? Icons.repeat_on_outlined : Icons.repeat_outlined),
            tooltip: '自動再生',
            onPressed: () => setState(() => _autoplay = !_autoplay),
          ),
        ],
      ),
      body: item == null
          ? const Center(child: Text('このカテゴリーにはフレーズがありません'))
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('${_pos + 1} / ${_indices.length}', style: theme.textTheme.bodySmall),
                    Expanded(
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 420),
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground(context),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item.primary, textAlign: TextAlign.center, style: theme.textTheme.headlineSmall),
                              if (item.romaji != null) ...[
                                const SizedBox(height: 6),
                                Text(item.romaji!, textAlign: TextAlign.center, style: theme.textTheme.bodySmall),
                              ],
                              const SizedBox(height: 16),
                              Text(item.meaning, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
                              const SizedBox(height: 18),
                              IconButton.filled(
                                icon: const Icon(Icons.volume_up_rounded),
                                onPressed: _speakCurrent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _pos > 0 ? _prev : null,
                            icon: const Icon(Icons.skip_previous_rounded),
                            label: const Text('前へ'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: _pos < _indices.length - 1 ? _next : null,
                            icon: const Icon(Icons.skip_next_rounded),
                            label: const Text('次へ'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
