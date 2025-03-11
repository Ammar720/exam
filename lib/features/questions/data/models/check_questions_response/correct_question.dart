class CorrectQuestion {
  final String qid;
  final String question;
  final String correctAnswer;

  const CorrectQuestion({
    required this.qid,
    required this.question,
    required this.correctAnswer,
  });

  factory CorrectQuestion.fromJson(Map<String, dynamic> json) {
    return CorrectQuestion(
      qid: json['QID'] as String,
      question: json['Question'] as String,
      correctAnswer: json['correctAnswer'] as String,
    );
  }
}
