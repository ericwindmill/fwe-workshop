# Intro-ish to Flutter workshop

## Application Implementation Steps

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