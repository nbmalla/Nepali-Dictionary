import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../state/progress_store.dart';
import '../theme/app_theme.dart';
import 'category_detail_screen.dart';
import 'category_grid_screen.dart';

/// "ホーム" tab: today's phrase, overall progress, and quick shortcuts
/// into a handful of categories.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  LessonItem? get _todaysPhrase {
    final allPhrases = <LessonItem>[];
    for (final items in lessonItemsByCategory.values) {
      allPhrases.addAll(items.where((i) => i.kind == ContentKind.phrase));
    }
    if (allPhrases.isEmpty) return null;
    final dayIndex = DateTime.now().difference(DateTime(DateTime.now().year)).inDays;
    return allPhrases[dayIndex % allPhrases.length];
  }

  @override
  void initState() {
    super.initState();
    ProgressStore.instance.load();
  }

  @override
  Widget build(BuildContext context) {
    final today = _todaysPhrase;
    final quickCategories = lessonCategories.take(6).toList();

    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: const Text('Nep Dictionary'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: ProgressStore.instance,
          builder: (context, _) {
            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                if (today != null) _TodaysPhraseCard(item: today),
                const SizedBox(height: 14),
                const _OverallProgressCard(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('カテゴリーを選ぶ', style: Theme.of(context).textTheme.titleMedium),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CategoryGridScreen()),
                      ),
                      child: const Text('すべて見る'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    mainAxisExtent: 84,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: quickCategories.length,
                  itemBuilder: (context, index) {
                    final category = quickCategories[index];
                    return _QuickCategoryTile(
                      category: category,
                      badgeIndex: index,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CategoryDetailScreen(categoryId: category.id)),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TodaysPhraseCard extends StatelessWidget {
  final LessonItem item;
  const _TodaysPhraseCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '今日のフレーズ',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(item.primary, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(item.meaning, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _OverallProgressCard extends StatelessWidget {
  const _OverallProgressCard();

  @override
  Widget build(BuildContext context) {
    var known = 0;
    var total = 0;
    for (final entry in lessonItemsByCategory.entries) {
      final phraseCount = entry.value.where((i) => i.kind == ContentKind.phrase).length;
      total += phraseCount;
      known += ProgressStore.instance.knownCountFor(entry.key, entry.value.length);
    }
    final theme = Theme.of(context);
    final ratio = total == 0 ? 0.0 : known / total;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground(context),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('全体の進捗', style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
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
                Text('$known / $total フレーズ 覚えた', style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickCategoryTile extends StatelessWidget {
  final LessonCategory category;
  final int badgeIndex;
  final VoidCallback onTap;

  const _QuickCategoryTile({required this.category, required this.badgeIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardBackground(context),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
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
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  category.jpLabel,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
