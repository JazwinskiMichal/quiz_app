class QuizQuestion {
  // Properties
  final String question;
  final List<String> answers;
  final String correctAnswer;

  // Constructor
  const QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  // Shuffle Answers Method
  List<String> shuffleAnswers() {
    final shuffeld = List.of(answers);
    shuffeld.shuffle();
    return shuffeld;
  }
}
