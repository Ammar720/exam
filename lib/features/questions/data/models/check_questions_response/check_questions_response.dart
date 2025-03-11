import 'correct_question.dart';
import 'wrong_question.dart';

class CheckQuestionsResponse {
  final String message;
  final int correct;
  final int wrong;
  final String total;
  final List<WrongQuestion> wrongQuestions;
  final List<CorrectQuestion> correctQuestions;

  const CheckQuestionsResponse({
    required this.message,
    required this.correct,
    required this.wrong,
    required this.total,
    required this.wrongQuestions,
    required this.correctQuestions,
  });

  factory CheckQuestionsResponse.fromJson(Map<String, dynamic> json) {
    return CheckQuestionsResponse(
      message: json['message'] as String,
      correct: json['correct'] as int,
      wrong: json['wrong'] as int,
      total: json['total'] as String,
      wrongQuestions: (json['WrongQuestions'] as List<dynamic>)
          .map((e) => WrongQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>)
          .map((e) => CorrectQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
