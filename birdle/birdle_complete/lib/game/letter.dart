enum LetterStatus { initial, correct, wrongPosition, incorrect }

class Letter {
  Letter({required this.char, this.status = LetterStatus.initial});

  final String char;
  final LetterStatus status;
}
