import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/styled_text.dart';

class AnswerButton extends StatelessWidget {
  // Properties
  final String answer;
  final void Function() onPressed;

  // Constructor
  const AnswerButton(
    this.answer,
    this.onPressed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 102, 17, 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 5,
        ),
      ),
      child: StyledText(
        text: answer,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
