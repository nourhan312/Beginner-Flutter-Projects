import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../game_brain.dart';
import '../widgets/navigate_button.dart';
import 'result.dart';

enum Choice { rock, paper, scissors, empty }

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int randomChoice() {
    return Random().nextInt(3) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242424),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Your Choice'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: kLargeTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildChoiceButton(
                      image: kRock,
                      onTap: () {
                        _navigateToResult(context, Choice.rock);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildChoiceButton(
                      image: kPaper,
                      onTap: () {
                        _navigateToResult(context, Choice.paper);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildChoiceButton(
                      image: kScissors,
                      onTap: () {
                        _navigateToResult(context, Choice.scissors);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: NavigateButton(
                onPressed: () => Navigator.pop(context),
                title: 'Home'.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceButton(
      {required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.grey[850]!, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.yellowAccent.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(image),
        ),
      ),
    );
  }

  void _navigateToResult(BuildContext context, Choice choice) {
    GameBrain gameBrain = GameBrain(
      choice: choice,
      aiChoice: randomChoice(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          winnerText: gameBrain.checkWinner(),
          aiImage: gameBrain.getAiImageChoice(),
          humanImage: choice == Choice.rock
              ? kRock
              : choice == Choice.paper
                  ? kPaper
                  : kScissors,
        ),
      ),
    );
  }
}
