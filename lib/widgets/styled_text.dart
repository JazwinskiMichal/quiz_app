import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  // Properties
  final String text;
  final double? fontSize;

  // Constructor
  const StyledText({
    super.key,
    required this.text,
    this.fontSize = 32.0,
  });

  // Overridden bild method
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
