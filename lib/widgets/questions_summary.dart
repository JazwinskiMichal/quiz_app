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

  bool isCorrectAnswer(Map<String, Object> data) {
    return data['selectedAnswer'] == data['correctAnswer'];
  }

  // Overridden build method
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (e) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isCorrectAnswer(e)
                            ? const Color.fromARGB(255, 135, 233, 105)
                            : const Color.fromARGB(255, 205, 80, 230),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: StyledText(
                          text: ((e['index'] as int) + 1).toString(),
                          color: const Color.fromARGB(255, 102, 17, 11),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          bottom: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledText(
                              text: e['question'] as String,
                              fontSize: 16,
                              textAlign: TextAlign.start,
                            ),
                            StyledText(
                              text:
                                  'Selected answer: ${e['selectedAnswer'] as String}',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.start,
                              color: Colors.amber,
                            ),
                            StyledText(
                              text:
                                  'Correct answer: ${e['correctAnswer'] as String}',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.start,
                              color: const Color.fromARGB(255, 160, 255, 7),
                            ),
                          ],
                        ),
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
