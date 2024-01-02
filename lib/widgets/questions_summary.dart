import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/styled_text.dart';

class QuestionsSummary extends StatelessWidget {
  // Properties
  final List<Map<String, Object>> summaryData;

  // Constructor
  const QuestionsSummary({
    required this.summaryData,
    super.key,
  });

  // Overridden build method
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: summaryData.map(
            (e) {
              return Row(children: [
                StyledText(
                  text: ((e['index'] as int) + 1).toString(),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(e['question'] as String),
                      Text(e['selectedAnswer'] as String),
                      Text(e['correctAnswer'] as String),
                    ],
                  ),
                )
              ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
