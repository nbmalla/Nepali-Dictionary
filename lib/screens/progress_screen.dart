import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../state/progress_store.dart';
import '../theme/app_theme.dart';
import 'category_detail_screen.dart';

/// "進捗" tab: per-category completion bars plus an overall total.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: const Text('進捗'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: ProgressStore.instance,
          builder: (context, _) {
            var totalKnown = 0;
            var totalPhrases = 0;
            for (final entry in lessonItemsByCategory.entries) {
              final phraseCount = entry.value.where((i) => i.kind == ContentKind.phrase).length;
              totalPhrases += phraseCount;
              totalKnown += ProgressStore.instance.knownCountFor(entry.key, entry.value.length);
            }

            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('合計', style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: 4),
                      Text(
                        '$totalKnown / $totalPhrases フレーズ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                for (var i = 0; i < lessonCategories.length; i++)
                  _CategoryProgressRow(category: lessonCategories[i], badgeIndex: i),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CategoryProgressRow extends StatelessWidget {
  final LessonCategory category;
  final int badgeIndex;
  const _CategoryProgressRow({required this.category, required this.badgeIndex});

  @override
  Widget build(BuildContext context) {
    final items = lessonItemsByCategory[category.id] ?? const <LessonItem>[];
    final total = items.where((i) => i.kind == ContentKind.phrase).length;
    final known = ProgressStore.instance.knownCountFor(category.id, items.length);
    final theme = Theme.of(context);
    final ratio = total == 0 ? 0.0 : known / total;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: AppColors.cardBackground(context),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => CategoryDetailScreen(categoryId: category.id)),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.jpLabel, style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: ratio,
                          minHeight: 6,
                          backgroundColor: theme.colorScheme.surfaceContainerHighest,
                          valueColor: const AlwaysStoppedAnimation(AppColors.progress),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text('$known/$total', style: theme.textTheme.labelSmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
