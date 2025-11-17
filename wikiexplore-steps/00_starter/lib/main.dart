import 'package:flutter/material.dart';
import 'package:wikiexplore_provider/util/scroll_behavior_util.dart';

// TODO: Add missing imports for state management (provider), UI elements, and feature pages.

void main() async {
  // TODO: Wrap the `MainApp` in a `MultiProvider` to make the app's view models
  // available throughout the widget tree.
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          // TODO: Add the app's theme.
          debugShowCheckedModeBanner: false,
          scrollBehavior: CustomScrollBehavior(),
          home: const HomeView(),
        );
      },
    );
  }
}

// TODO: Add a `Destinations` enum to represent the pages in the app
// and their associated labels and icons.

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // TODO: Add state and a handler for the currently selected destination.

  @override
  Widget build(BuildContext context) {
    // TODO: Add a `breakpoint` variable to facilitate building a responsive UI.
    return Scaffold(
      // TODO: Add a `AppBar` for small screens.

      // TODO: Add a `Row` with a `NavigationRail` for medium and large screens.
      body: Center(
        // TODO: Add a list of destination pages to show based on the selected index.
        child: Text('Hello World'),
      ),
      // TODO: Add a `BottomNavigationBar` for small screens.
    );
  }
}
