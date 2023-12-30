import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  // Properties
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  // Constructor
  const StyledText({
    super.key,
    required this.text,
    this.fontSize = 22.0,
    this.fontWeight = FontWeight.bold,
  });

  // Overridden bild method
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.white,
      ),
    );
  }
}
