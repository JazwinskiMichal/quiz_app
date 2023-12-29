import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/styled_text.dart';

class StartScreen extends StatelessWidget {
  // Properties
  final void Function() startQuiz;

  // Constructor
  const StartScreen(
    this.startQuiz, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(131, 255, 255, 255),
          ),
          const SizedBox(
            height: 20,
          ),
          const StyledText(
            text: 'Learn Flutter the fun way!',
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start quiz'),
            icon: const Icon(Icons.play_arrow),
          )
        ],
      ),
    );
  }
}
