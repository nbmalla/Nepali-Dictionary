import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../state/progress_store.dart';
import '../theme/app_theme.dart';
import '../widgets/knowledge_card.dart';
import '../widgets/phrase_flip_card.dart';

/// "学ぶ" mode: the full card-by-card list for a category, phrase cards
/// flip to reveal the meaning, knowledge cards read straight through.
class LearnModeScreen extends StatelessWidget {
  final String categoryId;
  const LearnModeScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final category = lessonCategories.firstWhere((c) => c.id == categoryId);
    final items = lessonItemsByCategory[categoryId] ?? const <LessonItem>[];

    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: Text(
          '学ぶ (सिक्नुहोस्): ${category.jpLabel}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: AnimatedBuilder(
        animation: ProgressStore.instance,
        builder: (context, _) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final item = items[index];
              if (item.kind == ContentKind.knowledge) {
                return KnowledgeCard(item: item);
              }
              return PhraseFlipCard(
                categoryId: categoryId,
                index: index,
                item: item,
                known: ProgressStore.instance.isKnown(categoryId, index),
                onToggleKnown: () => ProgressStore.instance.toggle(categoryId, index),
              );
            },
          );
        },
      ),
    );
  }
}
