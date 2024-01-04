import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  // Properties
  final List<String> selectedAnswers;
  final void Function() resetQuiz;

  // Get Mapped answers
  List<Map<String, Object>> get summaryData {
    final summary = <Map<String, Object>>[];

    for (var i = 0; i < selectedAnswers.length; i++) {
      final question = questions[i];
      final selectedAnswer = selectedAnswers[i];

      summary.add({
        'index': i,
        'question': question.question,
        'selectedAnswer': selectedAnswer,
        'correctAnswer': question.correctAnswer,
      });
    }

    return summary;
  }

  // Constructor
  const ResultsScreen({
    required this.selectedAnswers,
    required this.resetQuiz,
    super.key,
  });

  int calculateScore() {
    return selectedAnswers
        .where((x) => questions[selectedAnswers.indexOf(x)].correctAnswer == x)
        .length;
  }

  // Overridden build method
  @override
  Widget build(BuildContext context) {
    final int totalScore = questions.length;
    final int score = calculateScore();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored $score out of $totalScore!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: resetQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Play again'),
              icon: const Icon(Icons.replay),
            )
          ],
        ),
      ),
    );
  }
}
