class Question {
  final String questionText;

  final List<Answer> answers;

  Question({required this.questionText, required this.answers});
}

class Answer {
  final bool correctAnswer;

  final String answerText;

  Answer({required this.correctAnswer, required this.answerText});
}

List<Question> getQuizData() {
  List<Question> data = [];

  data.addAll([
    Question(
      questionText: 'What is the capital of France?',
      answers: [
        Answer(correctAnswer: false, answerText: 'Berlin'),
        Answer(correctAnswer: false, answerText: 'Madrid'),
        Answer(correctAnswer: true, answerText: 'Paris'),
        Answer(correctAnswer: false, answerText: 'Rome'),
      ],
    ),
    Question(
      questionText: 'Which planet is known as the Red Planet?',
      answers: [
        Answer(correctAnswer: false, answerText: 'Earth'),
        Answer(correctAnswer: true, answerText: 'Mars'),
        Answer(correctAnswer: false, answerText: 'Venus'),
        Answer(correctAnswer: false, answerText: 'Jupiter'),
      ],
    ),
    Question(
      questionText:
          'Which programming language is used for Flutter development?',
      answers: [
        Answer(correctAnswer: false, answerText: 'Java'),
        Answer(correctAnswer: true, answerText: 'Dart'),
        Answer(correctAnswer: false, answerText: 'Kotlin'),
        Answer(correctAnswer: false, answerText: 'Swift'),
      ],
    ),
    Question(
      questionText: 'What is the square root of 64?',
      answers: [
        Answer(correctAnswer: false, answerText: '6'),
        Answer(correctAnswer: true, answerText: '8'),
        Answer(correctAnswer: false, answerText: '10'),
        Answer(correctAnswer: false, answerText: '12'),
      ],
    ),
  ]);
  return data;
}
