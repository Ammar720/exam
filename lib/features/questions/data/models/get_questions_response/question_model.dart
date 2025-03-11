import 'package:exam/features/exams/data/models/exam_model.dart';
import 'package:exam/features/questions/data/models/get_questions_response/answer.dart';

import 'package:exam/features/questions/data/models/get_questions_response/subject.dart';

class QuestionModel {
  final String id;
  final String question;
  final String type;
  final String correct;
  final List<Answer> answers;
  final Subject subject;
  final ExamModel exam;
  final String createdAt;

  QuestionModel({
    required this.id,
    required this.question,
    required this.type,
    required this.correct,
    required this.answers,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['_id'],
      question: json['question'],
      type: json['type'],
      correct: json['correct'],
      answers:
          List<Answer>.from(json['answers'].map((a) => Answer.fromJson(a))),
      subject: Subject.fromJson(json['subject']),
      exam: ExamModel.fromJson(json['exam']),
      createdAt: json['createdAt'],
    );
  }
}
