import 'package:birdle_complete/game/game_provider.dart';
import 'package:flutter/material.dart';

import 'letter_tile.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key, required this.gameProvider});

  final GameProvider gameProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: gameProvider.board
          .map(
            (row) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row
                  .map(
                    (letter) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: LetterTile(letter: letter),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}
