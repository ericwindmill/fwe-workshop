import 'package:flutter/material.dart';

import '../game/game_provider.dart';
import 'keyboard_key.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
    required this.gameProvider,
    required this.onKeyPressed,
    required this.onDelete,
    required this.onEnter,
  });

  final GameProvider gameProvider;
  final void Function(String) onKeyPressed;
  final VoidCallback onDelete;
  final VoidCallback onEnter;

  static const List<String> _row1 = [
    'Q',
    'W',
    'E',
    'R',
    'T',
    'Y',
    'U',
    'I',
    'O',
    'P',
  ];
  static const List<String> _row2 = [
    'A',
    'S',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
  ];
  static const List<String> _row3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(_row1, gameProvider),
        _buildRow(_row2, gameProvider),
        _buildRow(_row3, gameProvider, isLastRow: true),
      ],
    );
  }

  Widget _buildRow(
    List<String> letters,
    GameProvider provider, {
    bool isLastRow = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLastRow) KeyboardKey(label: 'ENTER', onTap: onEnter, flex: 2),
        ...letters.map(
          (e) => KeyboardKey(label: e, onTap: () => onKeyPressed(e)),
        ),
        if (isLastRow) KeyboardKey(label: 'DEL', onTap: onDelete, flex: 2),
      ],
    );
  }
}
