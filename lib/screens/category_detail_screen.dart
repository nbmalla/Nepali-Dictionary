import 'package:flutter/material.dart';
import '../data/lesson_categories.dart';
import '../data/lesson_items_data.dart';
import '../models/lesson_item.dart';
import '../state/progress_store.dart';
import '../widgets/knowledge_card.dart';
import '../widgets/phrase_flip_card.dart';
import 'practice_screen.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String categoryId;
  const CategoryDetailScreen({super.key, required this.categoryId});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final category = lessonCategories.firstWhere((c) => c.id == widget.categoryId);
    final items = lessonItemsByCategory[widget.categoryId] ?? const <LessonItem>[];
    final hasPhrases = items.any((i) => i.kind == ContentKind.phrase);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(category.icon),
            const SizedBox(width: 8),
            Expanded(child: Text(category.jpLabel, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
      floatingActionButton: hasPhrases
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PracticeScreen(categoryId: widget.categoryId),
                ),
              ),
              icon: const Icon(Icons.style_rounded),
              label: const Text('練習する'),
            )
          : null,
      body: AnimatedBuilder(
        animation: ProgressStore.instance,
        builder: (context, _) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final item = items[index];
              if (item.kind == ContentKind.knowledge) {
                return KnowledgeCard(item: item);
              }
              return PhraseFlipCard(
                categoryId: widget.categoryId,
                index: index,
                item: item,
                known: ProgressStore.instance.isKnown(widget.categoryId, index),
                onToggleKnown: () => ProgressStore.instance.toggle(widget.categoryId, index),
              );
            },
          );
        },
      ),
    );
  }
}
