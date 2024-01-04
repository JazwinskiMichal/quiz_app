import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/styled_text.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  // Properties
  final void Function(String) onSelectAnswer;

  // Constructor
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // Anwser button callback
  void answerQuestion(String selectedAnswer) {
    // Pass the answer to the callback
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the questions
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              text: currentQuestion.question,
            ),
            const SizedBox(
              height: 20,
            ),
            // Spread operator to add all the answers to the list
            ...currentQuestion.shuffledAnswers.map((answer) => Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: AnswerButton(
                    answer,
                    () {
                      answerQuestion(answer);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
