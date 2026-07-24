enum ContentKind { phrase, knowledge }

class LessonItem {
  final ContentKind kind;
  final String primary;
  final String? romaji;
  final String meaning;
  final String? note;

  const LessonItem({
    this.kind = ContentKind.phrase,
    required this.primary,
    this.romaji,
    required this.meaning,
    this.note,
  });
}
