import 'dart:math';

import 'package:birdle_complete/game/resources/legal_words.dart';

import 'letter.dart';

final List<String> words = legalWords;

class GameProvider {
  GameProvider() {
    _initialize();
  }

  late String _secretWord;
  final List<List<Letter>> _board = [];
  int _currentRow = 0;
  String _currentGuess = '';

  List<List<Letter>> get board => _board;
  String get currentGuess => _currentGuess;

  void _initialize() {
    _secretWord = getNewWord();
    print(_secretWord);
    _board.addAll(
      List.generate(
        6,
        (_) => List.generate(_secretWord.length, (_) => Letter(char: '')),
      ),
    );
  }

  void addLetterToGuess(String char) {
    if (_currentGuess.length < _secretWord.length) {
      _currentGuess += char;
      _updateBoard();
    }
  }

  void removeLetter() {
    if (_currentGuess.isNotEmpty) {
      _currentGuess = _currentGuess.substring(0, _currentGuess.length - 1);
      _updateBoard();
    }
  }

  void submitGuess() {
    if (_currentGuess.length != _secretWord.length) {
      return; // Can't submit incomplete guess
    }

    final List<Letter> guess = _buildGuess();
    _board[_currentRow] = guess;
    _currentRow++;
    _currentGuess = '';
  }

  void _updateBoard() {
    final List<Letter> guess = _currentGuess
        .padRight(_secretWord.length)
        .split('')
        .map((e) => Letter(char: e))
        .toList();
    _board[_currentRow] = guess;
  }

  List<Letter> _buildGuess() {
    final List<Letter> guess = List.generate(
      _secretWord.length,
      (index) => Letter(char: _currentGuess[index]),
    );
    final List<String> remainingSecret = _secretWord.split('');

    // Step 1: Find correct letters
    for (int i = 0; i < _secretWord.length; i++) {
      if (guess[i].char == remainingSecret[i]) {
        guess[i] = Letter(char: guess[i].char, status: LetterStatus.correct);
        remainingSecret[i] = ''; // Mark as used
      }
    }

    // Step 2: Find wrong position letters
    for (int i = 0; i < _secretWord.length; i++) {
      if (guess[i].status == LetterStatus.initial) {
        if (remainingSecret.contains(guess[i].char)) {
          guess[i] = Letter(
            char: guess[i].char,
            status: LetterStatus.wrongPosition,
          );
          remainingSecret[remainingSecret.indexOf(guess[i].char)] =
              ''; // Mark as used
        } else {
          guess[i] = Letter(
            char: guess[i].char,
            status: LetterStatus.incorrect,
          );
        }
      }
    }
    return guess;
  }

  String getNewWord() {
    return words[Random().nextInt(words.length)].toUpperCase();
  }
}
