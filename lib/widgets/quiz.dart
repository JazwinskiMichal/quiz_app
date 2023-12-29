import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/questions_screen.dart';
import 'package:quiz_app/widgets/start_screen.dart';

class Quiz extends StatefulWidget {
  // Constructor
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  // Extra initialization when the state is created. Runs before build()
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  // Change the active screen
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  // Build the widget tree. Runs every time setState() is called
  @override
  Widget build(BuildContext context) {
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
          child: activeScreen,
        ),
      ),
    );
  }
}
