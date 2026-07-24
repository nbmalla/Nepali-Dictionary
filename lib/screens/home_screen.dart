import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../state/progress_store.dart';
import 'category_detail_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';

  List<LessonCategory> get _filtered {
    if (_query.trim().isEmpty) return lessonCategories;
    final q = _query.trim();
    return lessonCategories.where((c) {
      if (c.jpLabel.contains(q) || c.neLabel.contains(q)) return true;
      final items = lessonItemsByCategory[c.id] ?? const [];
      return items.any((i) => i.primary.contains(q) || i.meaning.contains(q));
    }).toList();
  }

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nep Dictionary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: '設定',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'フレーズを検索...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
            if (today != null) ...[
              const SizedBox(height: 16),
              _TodaysPhraseCard(item: today),
            ],
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                mainAxisExtent: 108,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _filtered.length,
              itemBuilder: (context, index) {
                final category = _filtered[index];
                final items = lessonItemsByCategory[category.id] ?? const [];
                final known = ProgressStore.instance.knownCountFor(category.id, items.length);
                return _CategoryTile(
                  category: category,
                  total: items.length,
                  known: known,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CategoryDetailScreen(categoryId: category.id)),
                  ),
                );
              },
            ),
          ],
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
    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final LessonCategory category;
  final int total;
  final int known;
  final VoidCallback onTap;

  const _CategoryTile({
    required this.category,
    required this.total,
    required this.known,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.icon, style: const TextStyle(fontSize: 26)),
              const Spacer(),
              Text(
                category.jpLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
              Text(
                category.neLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
              if (total > 0) ...[
                const SizedBox(height: 4),
                Text('$known / $total', style: theme.textTheme.labelSmall),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
