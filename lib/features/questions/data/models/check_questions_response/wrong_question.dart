class WrongQuestion {
  final String qid;
  final String question;
  final String inCorrectAnswer;
  final String correctAnswer;

  const WrongQuestion({
    required this.qid,
    required this.question,
    required this.inCorrectAnswer,
    required this.correctAnswer,
  });

  factory WrongQuestion.fromJson(Map<String, dynamic> json) => WrongQuestion(
        qid: json['QID'] as String,
        question: json['Question'] as String,
        inCorrectAnswer: json['inCorrectAnswer'] as String,
        correctAnswer: json['correctAnswer'] as String,
      );
}
