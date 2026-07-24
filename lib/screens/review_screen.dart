import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../state/progress_store.dart';
import '../theme/app_theme.dart';
import 'practice_screen.dart';

/// "ふくしゅう" tab: review every not-yet-known phrase, either across the
/// whole app or scoped to a single category.
class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  List<PracticeEntry> _notKnownEntries({String? categoryId}) {
    final entries = <PracticeEntry>[];
    final categoryIds = categoryId != null ? [categoryId] : lessonItemsByCategory.keys.toList();
    for (final id in categoryIds) {
      final items = lessonItemsByCategory[id] ?? const <LessonItem>[];
      for (var i = 0; i < items.length; i++) {
        final item = items[i];
        if (item.kind == ContentKind.phrase && !ProgressStore.instance.isKnown(id, i)) {
          entries.add(PracticeEntry(categoryId: id, index: i, item: item));
        }
      }
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: const Text('ふくしゅう'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: ProgressStore.instance,
          builder: (context, _) {
            final all = _notKnownEntries();
            final theme = Theme.of(context);

            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('未習得フレーズ', style: theme.textTheme.labelMedium),
                      const SizedBox(height: 4),
                      Text('${all.length} 枚', style: theme.textTheme.headlineSmall),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: all.isEmpty
                            ? null
                            : () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => PracticeScreen(title: 'ふくしゅう(全体)', entries: all),
                                  ),
                                ),
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: const Text('すべて復習する'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                for (var i = 0; i < lessonCategories.length; i++)
                  _CategoryReviewRow(
                    category: lessonCategories[i],
                    badgeIndex: i,
                    entries: _notKnownEntries(categoryId: lessonCategories[i].id),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CategoryReviewRow extends StatelessWidget {
  final LessonCategory category;
  final int badgeIndex;
  final List<PracticeEntry> entries;

  const _CategoryReviewRow({required this.category, required this.badgeIndex, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: AppColors.cardBackground(context),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PracticeScreen(title: 'ふくしゅう: ${category.jpLabel}', entries: entries),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.badgeFor(context, badgeIndex),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(category.icon, size: 18, color: AppColors.badgeIcon(context)),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(category.jpLabel, style: theme.textTheme.bodyMedium)),
                Text('残り${entries.length}問', style: theme.textTheme.labelSmall),
                const SizedBox(width: 6),
                const Icon(Icons.chevron_right_rounded, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
