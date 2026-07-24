import 'package:flutter/material.dart';

/// Shared visual tokens matching the app's warm, card-based design
/// reference: cream page background, white cards, soft pastel icon
/// badges, and a green progress accent.
class AppColors {
  static const seed = Color(0xFF4C5FD5);
  static const progress = Color(0xFF34A853);

  static const _creamBackground = Color(0xFFF3F0E8);
  static const _darkBackground = Color(0xFF14181F);
  static const _darkCard = Color(0xFF1F2430);

  static Color pageBackground(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _darkBackground : _creamBackground;

  static Color cardBackground(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? _darkCard : Colors.white;

  /// Pastel badge backgrounds, cycled by category position for gentle
  /// variety without a full per-category color map to maintain.
  static const List<Color> badgeLight = [
    Color(0xFFE4E1F7),
    Color(0xFFDDEBFB),
    Color(0xFFE3F3E1),
    Color(0xFFFCE8D9),
    Color(0xFFFBE3EC),
    Color(0xFFFFF3D6),
  ];

  static const List<Color> badgeDark = [
    Color(0xFF2C2E45),
    Color(0xFF23324A),
    Color(0xFF23402C),
    Color(0xFF453424),
    Color(0xFF432630),
    Color(0xFF453B22),
  ];

  static Color badgeFor(BuildContext context, int index) {
    final palette = Theme.of(context).brightness == Brightness.dark ? badgeDark : badgeLight;
    return palette[index % palette.length];
  }

  static Color badgeIcon(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? const Color(0xFFB6C0FF) : seed;
}
