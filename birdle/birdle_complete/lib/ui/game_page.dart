import 'package:birdle_complete/game/game_provider.dart';
import 'package:flutter/material.dart';

import 'game_board.dart';
import 'keyboard.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final GameProvider _gameProvider;

  @override
  void initState() {
    super.initState();
    _gameProvider = GameProvider();
  }

  void _onKeyPressed(String letter) {
    setState(() {
      _gameProvider.addLetterToGuess(letter);
    });
  }

  void _onDelete() {
    setState(() {
      _gameProvider.removeLetter();
    });
  }

  void _onEnter() {
    setState(() {
      _gameProvider.submitGuess();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Birdle'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Center(child: GameBoard(gameProvider: _gameProvider)),
          ),
          Keyboard(
            gameProvider: _gameProvider,
            onKeyPressed: _onKeyPressed,
            onDelete: _onDelete,
            onEnter: _onEnter,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
