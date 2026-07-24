import 'package:flutter/material.dart';
import '../models/lesson_item.dart';

/// Read-only card for a knowledge/etiquette [LessonItem]. No flip, no
/// speaker button — it's a short article, not a phrase to memorize.
class KnowledgeCard extends StatelessWidget {
  final LessonItem item;

  const KnowledgeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.menu_book_rounded, size: 18, color: theme.colorScheme.tertiary),
                const SizedBox(width: 6),
                Text(
                  '知識カード',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(item.primary, style: theme.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(item.meaning, style: theme.textTheme.bodyMedium),
            if (item.note != null) ...[
              const SizedBox(height: 6),
              Text(
                item.note!,
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
