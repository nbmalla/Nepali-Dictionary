import 'dart:math';
import 'package:flutter/material.dart';
import '../models/lesson_item.dart';
import '../services/audio_service.dart';
import '../state/app_settings.dart';

/// A tappable card for a single phrase-kind [LessonItem]: front shows the
/// Japanese phrase + romaji, back shows the Nepali meaning + note. Tapping
/// anywhere on the card flips it with a 3D rotation.
class PhraseFlipCard extends StatefulWidget {
  final String categoryId;
  final int index;
  final LessonItem item;
  final bool known;
  final VoidCallback onToggleKnown;

  const PhraseFlipCard({
    super.key,
    required this.categoryId,
    required this.index,
    required this.item,
    required this.known,
    required this.onToggleKnown,
  });

  @override
  State<PhraseFlipCard> createState() => _PhraseFlipCardState();
}

class _PhraseFlipCardState extends State<PhraseFlipCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 320),
  );
  bool _showingBack = false;

  void _flip() {
    setState(() => _showingBack = !_showingBack);
    if (_showingBack) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * pi;
          final showBack = angle > pi / 2;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0012)
              ..rotateY(angle),
            child: showBack
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi),
                    child: _buildBack(theme),
                  )
                : _buildFront(theme),
          );
        },
      ),
    );
  }

  Widget _buildFront(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.primary, style: theme.textTheme.titleLarge),
                  if (widget.item.romaji != null) ...[
                    const SizedBox(height: 4),
                    Text(widget.item.romaji!, style: theme.textTheme.bodySmall),
                  ],
                ],
              ),
            ),
            if (AppSettings.instance.showSpeakerButtons)
              IconButton(
                icon: const Icon(Icons.volume_up_rounded),
                tooltip: '発音を聞く',
                onPressed: () => AudioService.instance.speak(
                  widget.categoryId,
                  widget.index,
                  widget.item.primary,
                  rate: AppSettings.instance.speechRate,
                ),
              ),
            IconButton(
              icon: Icon(
                widget.known ? Icons.check_circle : Icons.check_circle_outline,
                color: widget.known ? Colors.green : null,
              ),
              tooltip: '覚えた',
              onPressed: widget.onToggleKnown,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBack(ThemeData theme) {
    return Card(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.item.meaning, style: theme.textTheme.titleMedium),
            if (widget.item.note != null) ...[
              const SizedBox(height: 6),
              Text(widget.item.note!, style: theme.textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}
