import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> data = getQuizData();

  int currentIndex = 0;
  String selectedAnswer = '';
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 29,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Simple Quiz App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Question  ${currentIndex + 1} / ${data.length.toString()} ",
                maxLines: 4,
                style: TextStyle(
                  color: Colors.white,

                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 85,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    data[currentIndex].questionText,
                    style: const TextStyle(color: Colors.black, fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  left: -20,
                  top: 0,
                  bottom: 0,
                  child: CircleAvatar(backgroundColor: Colors.black),
                ),
                Positioned(
                  right: -20,
                  top: 0,
                  bottom: 0,
                  child: CircleAvatar(backgroundColor: Colors.black),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: -30,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.check, color: Colors.green, size: 50),
                  ),
                ),
              ],
            ),

            for (Answer answer in data[currentIndex].answers)
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedAnswer = answer.answerText;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answer.correctAnswer &&
                                (selectedAnswer == answer.answerText)
                            ? Colors.green
                            : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: Text(
                    answer.answerText,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),

            SizedBox(
              height: 60,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (data[currentIndex].answers.any(
                      (ans) =>
                          ans.answerText == selectedAnswer && ans.correctAnswer,
                    )) {
                      score++;
                    }
                    if (currentIndex == data.length - 1) {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text("Quiz Completed"),
                              content: Text(
                                "Your score is ${score.toString()} / ${data.length}",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      currentIndex = 0;
                                      selectedAnswer = '';
                                      score = 0;
                                    });
                                  },
                                  child: const Text("Restart"),
                                ),
                              ],
                            ),
                      );
                    } else if (selectedAnswer.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select an answer ."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      currentIndex++;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                child: Text(
                  currentIndex == data.length - 1 ? 'Sumbit' : 'Next',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
