# Birdle - A Wordle Clone in Flutter

This document walks through the work done to create a Wordle clone in Flutter.

## 1. Project Setup

The initial project was in a broken state, with missing files and empty directories. The following steps were taken to fix the project structure:

*   Created the `lib/game` and `lib/ui` directories.
*   Created the following files:
    *   `lib/game/game_provider.dart`
    *   `lib/game/word_repository.dart`
    *   `lib/ui/game_page.dart`
    *   `lib/game/letter_status.dart`
    *   `lib/game/letter.dart`
    *   `lib/ui/letter_tile.dart`
    *   `lib/ui/game_board.dart`
    *   `lib/ui/keyboard_key.dart`
    *   `lib/ui/keyboard.dart`

## 2. Game Logic

The core game logic was implemented in the `GameProvider` and `WordRepository` classes.

*   **`WordRepository`**: This class is responsible for providing the secret words for the game. It currently uses a hardcoded list of words.
*   **`GameProvider`**: This class manages the game's state, including the secret word, the user's guesses, and the current guess. It also handles user input and evaluates guesses.

## 3. User Interface

The user interface was built using a combination of widgets:

*   **`LetterTile`**: Displays a single letter in the grid, with its appearance changing based on the letter's status.
*   **`GameBoard`**: Arranges the letter tiles in a grid to form the game board.
*   **`KeyboardKey`**: Represents a single key on the on-screen keyboard.
*   **`Keyboard`**: Arranges the keys into a QWERTY layout and handles user input.
*   **`GamePage`**: Assembles all the UI components to create the final user interface.

## 4. How to Play

To play the game, run the application using `flutter run`. The game will select a random word, and you can start guessing by typing on the on-screen keyboard. The color of the tiles will change to indicate whether the letters are in the correct position, the wrong position, or not in the word at all.
