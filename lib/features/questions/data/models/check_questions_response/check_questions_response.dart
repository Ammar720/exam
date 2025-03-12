import 'package:exam/features/questions/data/models/check_questions_response/correct_question_model.dart';
import 'package:exam/features/questions/data/models/check_questions_response/wrong_question_model.dart';

class CheckQuestionsResponse {
  final String message;
  final int correct;
  final int wrong;
  final String total;
  final List<WrongQuestionModel> wrongQuestions;
  final List<CorrectQuestionModel> correctQuestions;

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
          .map((e) => WrongQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>)
          .map((e) => CorrectQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
