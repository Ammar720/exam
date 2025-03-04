import 'exam_model.dart';

class ExamResponse {
  final String message;
  final List<ExamModel> exams;

  const ExamResponse({required this.message, required this.exams});

  factory ExamResponse.fromJson(Map<String, dynamic> json) => ExamResponse(
        message: json['message'] as String,
        exams: (json['exams'] as List<dynamic>)
            .map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
