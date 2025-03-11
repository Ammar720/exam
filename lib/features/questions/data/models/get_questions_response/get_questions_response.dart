import 'question_model.dart';

class GetQuestionsResponse {
  final String message;
  final List<QuestionModel> questions;

  const GetQuestionsResponse({required this.message, required this.questions});

  factory GetQuestionsResponse.fromJson(Map<String, dynamic> json) {
    return GetQuestionsResponse(
      message: json['message'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
