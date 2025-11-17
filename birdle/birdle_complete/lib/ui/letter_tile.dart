import 'package:flutter/material.dart';

import '../game/letter.dart';

class LetterTile extends StatelessWidget {
  const LetterTile({super.key, required this.letter});

  final Letter letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        border: Border.all(color: _getBorderColor(context), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          letter.char,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (letter.status) {
      case LetterStatus.initial:
        return Theme.of(context).colorScheme.surface;
      case LetterStatus.correct:
        return Colors.green;
      case LetterStatus.wrongPosition:
        return Colors.amber;
      case LetterStatus.incorrect:
        return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2);
    }
  }

  Color _getBorderColor(BuildContext context) {
    if (letter.char.isNotEmpty) {
      return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5);
    }
    return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2);
  }
}
