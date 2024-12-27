import 'package:rock_paper_scissors/constants.dart';
import 'package:rock_paper_scissors/screens/game.dart';

const int rock = 1;
const int paper = 2;
const int scissors = 3;

class GameBrain {
  final Choice choice;
  final int aiChoice;

  GameBrain({
    required this.choice,
    required this.aiChoice,
  });

  int getAiChoice() {
    return aiChoice;
  }

  Choice getHumanChoice() {
    return choice;
  }

  String getAiImageChoice() {
    switch (aiChoice) {
      case rock:
        return kRock;
      case paper:
        return kPaper;
      case scissors:
        return kScissors;
      default:
        return '';
    }
  }

  String checkWinner() {
    if (choice == Choice.rock && aiChoice == rock ||
        choice == Choice.paper && aiChoice == paper ||
        choice == Choice.scissors && aiChoice == scissors) {
      return "It is a tie";
    } else if (choice == Choice.rock && aiChoice == scissors ||
        choice == Choice.paper && aiChoice == rock ||
        choice == Choice.scissors && aiChoice == paper) {
      return 'You are a winner';
    } else {
      return 'AI is a winner';
    }
  }
}
