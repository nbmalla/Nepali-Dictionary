import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../services/audio_service.dart';
import '../state/app_settings.dart';
import '../state/progress_store.dart';
import '../theme/app_theme.dart';
import 'learn_mode_screen.dart';
import 'listen_mode_screen.dart';
import 'practice_screen.dart';

/// Category landing screen: header with progress, a 2x2 mode picker
/// (学ぶ/きく/ためす/ふくしゅう), and a flat reference list of every
/// word/phrase in the category.
class CategoryDetailScreen extends StatelessWidget {
  final String categoryId;
  const CategoryDetailScreen({super.key, required this.categoryId});

  List<PracticeEntry> _phraseEntries({bool onlyNotKnown = false}) {
    final items = lessonItemsByCategory[categoryId] ?? const <LessonItem>[];
    final entries = <PracticeEntry>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      if (item.kind != ContentKind.phrase) continue;
      if (onlyNotKnown && ProgressStore.instance.isKnown(categoryId, i)) continue;
      entries.add(PracticeEntry(categoryId: categoryId, index: i, item: item));
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    final category = lessonCategories.firstWhere((c) => c.id == categoryId);
    final badgeIndex = lessonCategories.indexOf(category);
    final items = lessonItemsByCategory[categoryId] ?? const <LessonItem>[];
    final hasPhrases = items.any((i) => i.kind == ContentKind.phrase);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: Text(category.jpLabel),
      ),
      body: AnimatedBuilder(
        animation: ProgressStore.instance,
        builder: (context, _) {
          final total = items.where((i) => i.kind == ContentKind.phrase).length;
          final known = ProgressStore.instance.knownCountFor(categoryId, items.length);
          final ratio = total == 0 ? 0.0 : known / total;

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.badgeFor(context, badgeIndex),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(category.icon, size: 22, color: AppColors.badgeIcon(context)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category.jpLabel, style: theme.textTheme.titleLarge),
                        Text(category.subtitle, style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              if (total > 0) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: ratio,
                    minHeight: 8,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    valueColor: const AlwaysStoppedAnimation(AppColors.progress),
                  ),
                ),
                const SizedBox(height: 6),
                Text('$known/$total 完了・全$total項目', style: theme.textTheme.labelSmall),
              ],
              const SizedBox(height: 20),
              Text('モードを選ぶ', style: theme.textTheme.titleSmall),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.7,
                children: [
                  _ModeTile(
                    icon: Icons.menu_book_outlined,
                    label: '学ぶ',
                    enabled: items.isNotEmpty,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LearnModeScreen(categoryId: categoryId)),
                    ),
                  ),
                  _ModeTile(
                    icon: Icons.headphones_outlined,
                    label: 'きく',
                    enabled: hasPhrases,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ListenModeScreen(categoryId: categoryId)),
                    ),
                  ),
                  _ModeTile(
                    icon: Icons.fact_check_outlined,
                    label: 'ためす',
                    enabled: hasPhrases,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PracticeScreen(
                          title: 'ためす: ${category.jpLabel}',
                          entries: _phraseEntries(),
                        ),
                      ),
                    ),
                  ),
                  _ModeTile(
                    icon: Icons.replay_outlined,
                    label: 'ふくしゅう',
                    enabled: hasPhrases,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PracticeScreen(
                          title: 'ふくしゅう: ${category.jpLabel}',
                          entries: _phraseEntries(onlyNotKnown: true),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('単語・フレーズ一覧', style: theme.textTheme.titleSmall),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < items.length; i++) ...[
                      if (i > 0) const Divider(height: 1),
                      _WordRow(index: i, categoryId: categoryId, item: items[i]),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ModeTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool enabled;
  final VoidCallback onTap;

  const _ModeTile({required this.icon, required this.label, required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardBackground(context),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: enabled ? onTap : null,
        child: Opacity(
          opacity: enabled ? 1 : 0.4,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20, color: AppColors.badgeIcon(context)),
                const SizedBox(width: 8),
                Text(label, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WordRow extends StatefulWidget {
  final int index;
  final String categoryId;
  final LessonItem item;
  const _WordRow({required this.index, required this.categoryId, required this.item});

  @override
  State<_WordRow> createState() => _WordRowState();
}

class _WordRowState extends State<_WordRow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              child: Text('${widget.index + 1}', style: theme.textTheme.labelSmall),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.primary, style: theme.textTheme.bodyLarge),
                  if (widget.item.romaji != null)
                    Text(widget.item.romaji!, style: theme.textTheme.bodySmall),
                  if (_expanded) ...[
                    const SizedBox(height: 6),
                    Text(widget.item.meaning, style: theme.textTheme.bodyMedium),
                    if (widget.item.note != null) ...[
                      const SizedBox(height: 4),
                      Text(widget.item.note!, style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
                    ],
                  ],
                ],
              ),
            ),
            if (widget.item.kind == ContentKind.phrase)
              IconButton(
                icon: const Icon(Icons.volume_up_outlined, size: 20),
                onPressed: () => AudioService.instance.speak(
                  widget.categoryId,
                  widget.index,
                  widget.item.primary,
                  rate: AppSettings.instance.speechRate,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
