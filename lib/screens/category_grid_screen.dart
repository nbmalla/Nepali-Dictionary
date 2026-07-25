import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../state/progress_store.dart';
import '../theme/app_theme.dart';
import 'category_detail_screen.dart';

/// "学ぶ" tab: searchable grid of every lesson category.
class CategoryGridScreen extends StatefulWidget {
  const CategoryGridScreen({super.key});

  @override
  State<CategoryGridScreen> createState() => _CategoryGridScreenState();
}

class _CategoryGridScreenState extends State<CategoryGridScreen> {
  String _query = '';

  List<LessonCategory> get _filtered {
    if (_query.trim().isEmpty) return lessonCategories;
    final q = _query.trim();
    return lessonCategories.where((c) {
      if (c.jpLabel.contains(q) || c.neLabel.contains(q) || c.subtitle.contains(q)) return true;
      final items = lessonItemsByCategory[c.id] ?? const [];
      return items.any((i) => i.primary.contains(q) || i.meaning.contains(q));
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    ProgressStore.instance.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: const Text('学ぶ'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'フレーズを検索...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.cardBackground(context),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: ProgressStore.instance,
              builder: (context, _) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    mainAxisExtent: 168,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  itemCount: _filtered.length,
                  itemBuilder: (context, index) {
                    final category = _filtered[index];
                    final badgeIndex = lessonCategories.indexOf(category);
                    final items = lessonItemsByCategory[category.id] ?? const [];
                    final known = ProgressStore.instance.knownCountFor(category.id, items.length);
                    return _CategoryCard(
                      category: category,
                      badgeIndex: badgeIndex,
                      total: items.length,
                      known: known,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CategoryDetailScreen(categoryId: category.id)),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final LessonCategory category;
  final int badgeIndex;
  final int total;
  final int known;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.badgeIndex,
    required this.total,
    required this.known,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: AppColors.cardBackground(context),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.badgeFor(context, badgeIndex),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(category.icon, size: 20, color: AppColors.badgeIcon(context)),
              ),
              const Spacer(),
              Text(
                category.jpLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
              Text(
                category.neLabel,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              if (total > 0) ...[
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: known / total,
                    minHeight: 5,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    valueColor: const AlwaysStoppedAnimation(AppColors.progress),
                  ),
                ),
                const SizedBox(height: 4),
                Text('$known/$total', style: theme.textTheme.labelSmall),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
