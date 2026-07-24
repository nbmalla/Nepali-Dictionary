import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../services/tts_service.dart';
import '../state/app_settings.dart';
import '../state/progress_store.dart';

/// Sequential "swipe through" practice mode over the phrase-kind items of
/// one category. "わかった" marks the card known and drops it from the
/// queue; "もう一度" sends it to the back of the queue for another pass.
class PracticeScreen extends StatefulWidget {
  final String categoryId;
  const PracticeScreen({super.key, required this.categoryId});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late final List<int> _originalIndices;
  late final List<LessonItem> _allItems;
  late List<int> _queue;
  int _learnedCount = 0;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _allItems = lessonItemsByCategory[widget.categoryId] ?? const <LessonItem>[];
    _originalIndices = [
      for (var i = 0; i < _allItems.length; i++)
        if (_allItems[i].kind == ContentKind.phrase) i,
    ];
    _queue = List.of(_originalIndices);
  }

  LessonItem? get _current => _queue.isEmpty ? null : _allItems[_queue.first];

  void _again() {
    setState(() {
      final head = _queue.removeAt(0);
      _queue.add(head);
      _revealed = false;
    });
  }

  void _gotIt() {
    final index = _queue.first;
    ProgressStore.instance.markKnown(widget.categoryId, index);
    setState(() {
      _queue.removeAt(0);
      _learnedCount++;
      _revealed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = lessonCategories.firstWhere((c) => c.id == widget.categoryId);
    final item = _current;

    return Scaffold(
      appBar: AppBar(title: Text('練習: ${category.jpLabel}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: item == null
              ? _SummaryView(learnedCount: _learnedCount, total: _originalIndices.length)
              : Column(
                  children: [
                    LinearProgressIndicator(
                      value: _originalIndices.isEmpty
                          ? 0
                          : 1 - (_queue.length / (_originalIndices.length + _learnedCount).clamp(1, 1 << 30)),
                    ),
                    const SizedBox(height: 8),
                    Text('残り ${_queue.length} 枚 ・ わかった $_learnedCount 枚'),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () => setState(() => _revealed = !_revealed),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 220),
                            child: _revealed
                                ? _CardFace(
                                    key: const ValueKey('back'),
                                    primary: item.meaning,
                                    secondary: item.note,
                                    background: Theme.of(context).colorScheme.secondaryContainer,
                                  )
                                : _CardFace(
                                    key: const ValueKey('front'),
                                    primary: item.primary,
                                    secondary: item.romaji,
                                    background: Theme.of(context).colorScheme.primaryContainer,
                                    onSpeak: () => TtsService.instance.speak(
                                      item.primary,
                                      rate: AppSettings.instance.speechRate,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _again,
                            child: const Text('もう一度'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton(
                            onPressed: _gotIt,
                            child: const Text('わかった'),
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

class _CardFace extends StatelessWidget {
  final String primary;
  final String? secondary;
  final Color background;
  final VoidCallback? onSpeak;

  const _CardFace({
    super.key,
    required this.primary,
    required this.background,
    this.secondary,
    this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 420, minHeight: 220),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(primary, textAlign: TextAlign.center, style: theme.textTheme.headlineSmall),
          if (secondary != null) ...[
            const SizedBox(height: 8),
            Text(secondary!, textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
          ],
          if (onSpeak != null) ...[
            const SizedBox(height: 12),
            IconButton(icon: const Icon(Icons.volume_up_rounded), onPressed: onSpeak),
          ],
        ],
      ),
    );
  }
}

class _SummaryView extends StatelessWidget {
  final int learnedCount;
  final int total;
  const _SummaryView({required this.learnedCount, required this.total});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.celebration_rounded, size: 56),
          const SizedBox(height: 12),
          Text('お疲れさまでした！', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('$total 枚中 $learnedCount 枚 わかった'),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('カテゴリーに戻る'),
          ),
        ],
      ),
    );
  }
}
