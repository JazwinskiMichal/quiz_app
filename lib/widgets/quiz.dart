import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/questions_screen.dart';
import 'package:quiz_app/widgets/results_screen.dart';
import 'package:quiz_app/widgets/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  // Constructor
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers =
      []; // Final if not reassigned, but for example added

  // Extra initialization when the state is created. Runs before build()
  @override
  void initState() {
    activeScreen = StartScreen(startQuiz);
    super.initState();
  }

  // Start quiz method
  void startQuiz() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  // Choose answer method
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length < questions.length) {
      // setState(() {
      //   activeScreen = QuestionsScreen(
      //     onSelectAnswer: chooseAnswer,
      //   );
      // });
    } else {
      setState(() {
        activeScreen = ResultsScreen(
          selectedAnswers: selectedAnswers,
          resetQuiz: startQuiz,
        );
      });
    }
  }

  // Build the widget tree. Runs every time setState() is called
  @override
  Widget build(BuildContext context) {
    // Can also use if/else statement to switch between screens. Then initiState() is not needed.

    // var screenWidget = StartScreen(switchScreen);
    // if (activeScreen == 'start-screen') {
    //   screenWidget = StartScreen(switchScreen);
    // } else {
    //   screenWidget = const QuestionsScreen();
    // }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.red,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen, // could also use ternary solution like activeScreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionsScreen(). Then initiState() is not needed.
        ),
      ),
    );
  }
}
