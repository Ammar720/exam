class WrongQuestionModel {
  final String qid;
  final String question;
  final String inCorrectAnswer;
  final String correctAnswer;

  const WrongQuestionModel({
    required this.qid,
    required this.question,
    required this.inCorrectAnswer,
    required this.correctAnswer,
  });

  factory WrongQuestionModel.fromJson(Map<String, dynamic> json) {
    return WrongQuestionModel(
      qid: json['QID'] as String,
      question: json['Question'] as String,
      inCorrectAnswer: json['inCorrectAnswer'] as String,
      correctAnswer: json['correctAnswer'] as String,
    );
  }
}
