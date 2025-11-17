import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'game/game_provider.dart';
import 'game/word_repository.dart';
import 'ui/game_page.dart';

void main() {
  runApp(const BirdleApp());
}

class BirdleApp extends StatelessWidget {
  const BirdleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => WordRepository()),
        ChangeNotifierProxyProvider<WordRepository, GameProvider>(
          create: (context) => GameProvider(
            wordRepository: context.read<WordRepository>(),
          ),
          update: (context, repo, previous) =>
              previous ?? GameProvider(wordRepository: repo),
        ),
      ],
      child: MaterialApp(
        title: 'Birdle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          textTheme: GoogleFonts.notoSansTextTheme(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const GamePage(),
      ),
    );
  }
}
