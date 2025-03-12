class WrongQuestionEntity {
  final String qid;
  final String question;
  final String inCorrectAnswer;
  final String correctAnswer;

  const WrongQuestionEntity({
    required this.qid,
    required this.question,
    required this.inCorrectAnswer,
    required this.correctAnswer,
  });
}
