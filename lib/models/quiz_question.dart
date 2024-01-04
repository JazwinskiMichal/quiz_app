class QuizQuestion {
  // Properties
  final String question;
  final List<String> answers;
  final String correctAnswer;

  // Shuffled Answers Getter
  List<String> get shuffledAnswers {
    final shuffeld = List.of(answers);
    shuffeld.shuffle();

    return shuffeld;
  }

  // Constructor
  const QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}
