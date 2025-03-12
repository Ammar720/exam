class CorrectQuestionModel {
  final String qid;
  final String question;
  final String correctAnswer;

  const CorrectQuestionModel({
    required this.qid,
    required this.question,
    required this.correctAnswer,
  });

  factory CorrectQuestionModel.fromJson(Map<String, dynamic> json) {
    return CorrectQuestionModel(
      qid: json['QID'] as String,
      question: json['Question'] as String,
      correctAnswer: json['correctAnswer'] as String,
    );
  }
}
