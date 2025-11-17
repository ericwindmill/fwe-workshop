# Intro-ish to Flutter workshop

## Birdle - Flutter 101

<img src="https://github.com/ericwindmill/fwe-workshop/blob/main/docs/birdle.png" width="400"/>

In this workshop, attendees will build "Birdle," a Wordle-style word guessing game, through the following progressive steps:

1.  **Project Setup & Repair**: Initialize the application and create the necessary file and directory structure for a clean, runnable Flutter project.
    *   **Concepts**: Flutter project structure, `pubspec.yaml`.

2.  **Core Game Logic**: Implement the game's state management within a single `GameProvider` class. This includes logic for selecting a secret word, tracking user guesses, and evaluating the correctness of each letter.
    *   **Concepts**: Dart classes, `List` manipulation, `enum`, `Random`.

3.  **Stateful Widgets**: Build the app using a `StatefulWidget` to manage the game's state directly, using `setState` to trigger UI updates in response to user actions.
    *   **Concepts**: `StatefulWidget` vs. `StatelessWidget`, widget lifecycle (`initState`), `setState`.
    *   **Widgets**: `GamePage`.

4.  **UI Components**: Construct the user interface by creating several reusable, single-purpose widgets.
    *   **Concepts**: Widget composition, passing data via constructors.
    *   **`LetterTile`**: `Container`, `BoxDecoration`, `Center`, `Text`.
    *   **`GameBoard`**: `Column`, `Row`, generating widgets with `.map()`.
    *   **`Keyboard` & `KeyboardKey`**: `Expanded`, `Padding`, `Material`, `InkWell`, passing callbacks.

5.  **Final Assembly**: Combine the `GameBoard` and `Keyboard` widgets within the main `GamePage` to create the complete, interactive game screen.
    *   **Concepts**: App layout.
    *   **Widgets**: `Scaffold`, `AppBar`, `Column`, `Expanded`, `Center`, `SizedBox`.

## Wikiexplore

<img src="https://github.com/ericwindmill/fwe-workshop/blob/main/docs/wikiexplore-article.png" height="300"/>

<img src="https://github.com/ericwindmill/fwe-workshop/blob/main/docs/wikiexplore-timeline.png" height="300"/>

### Application Implementation Steps

In this workshop, attendees will build the "WikiExplore" application through the following progressive steps:

1.  **App Structure & Navigation**: Initialize the app shell, configure the global theme, and implement responsive navigation that adapts between mobile (bottom bar) and desktop (navigation rail) layouts.
2.  **Data Layer**: Implement the `TimelineRepository` to fetch "On This Day" historical events from the Wikipedia API, including JSON parsing and error handling.
3.  **State Management**: Create the `TimelineViewModel` using `ChangeNotifier` to manage the data state (loading, success, error) and expose it to the UI using `Provider`.
4.  **Basic UI**: Build the initial list of events using `ListView.builder` and standard Flutter widgets to verify data connection and basic layout.
5.  **Polish & Animations**: Refactor the UI to use custom painting for the timeline visualization, implement responsive layout adjustments, and add professional entrance animations using `flutter_animate`.

## Workshop Concepts: Flutter & Dart

This workshop covers a comprehensive set of Flutter and Dart concepts, guiding developers from basic app structure to a polished, production-ready feature.

## Dart Language Features
*   **Asynchronous Programming**: Using `async`, `await`, and `Future` for non-blocking operations (e.g., network requests).
*   **Generics**: Implementing type-safe classes and methods.
*   **Enums**: Defining strongly-typed sets of values (e.g., for navigation destinations or event types).
*   **Exports**: Structuring libraries using `export` to create clean public APIs.

## Architecture & Design Patterns
*   **MVVM (Model-View-ViewModel)**: Separating business logic and state from the UI.
*   **Repository Pattern**: Abstracting data fetching and caching logic from the rest of the app.
*   **Dependency Injection**: Using `Provider` to inject dependencies (like repositories) into ViewModels and ViewModels into Widgets.
*   **Builder Pattern**: Using `Builder` widgets to access the correct `BuildContext`.

## State Management
*   **ChangeNotifier**: Creating observable objects that notify listeners of changes.
*   **ValueNotifier**: Managing simple reactive state.
*   **Provider Package**:
    *   `MultiProvider`: Registering multiple providers at the root of the app.
    *   `Consumer`: Rebuilding UI widgets when state changes.
    *   `context.read` vs `context.watch`: Optimizing rebuilds by choosing the correct access method.
    *   `Selector`: Listening to specific parts of a state object (implied best practice).

## Data Layer
*   **HTTP Networking**: Making GET requests to REST APIs using the `http` package.
*   **JSON Serialization**: Parsing JSON data into Dart objects (`fromJson`).
*   **Data Modeling**: Creating immutable data classes.
*   **Caching**: Implementing simple in-memory caching strategies.
*   **Error Handling**: Managing network errors and exceptions gracefully.

## User Interface (UI)
*   **Layout & Structure**:
    *   `Scaffold`: The basic visual layout structure.
    *   `ListView.builder`: Efficiently rendering large lists of data.
    *   `Stack`, `Column`, `Row`: Composing complex layouts.
    *   `Container`, `Padding`, `SizedBox`: Styling and spacing.
*   **Responsiveness**:
    *   **Adaptive Navigation**: Switching between `BottomNavigationBar` (mobile) and `NavigationRail` (tablet/desktop).
    *   **Breakpoints**: Adjusting layout and padding based on screen width.
*   **Theming**:
    *   `ThemeData`: Defining global app styles.
    *   `TextTheme`: Using consistent typography.
    *   `CupertinoTheme`: Supporting iOS-style aesthetics.
*   **Custom Painting**:
    *   `CustomPaint` & `CustomPainter`: Drawing custom graphics (timelines) directly on the canvas.

## Animations
*   **Implicit Animations**: Using simple animated widgets.
*   **Explicit Animations (flutter_animate)**:
    *   **Chained Effects**: Combining fade, slide, and scale effects.
    *   **Staggered Animations**: Animating list items sequentially with delays.
    *   **Keyed Animations**: Triggering animations based on state changes (e.g., `ValueKey`).