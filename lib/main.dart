import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/game.dart';
import 'package:rock_paper_scissors/screens/home.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/game': (context) => const Game(),
      },
    );
  }
}
