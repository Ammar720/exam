import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/questions/data/models/get_questions_response/answer.dart';

class Question {
  final String id;
  final String question;
  final List<Answer> answers;
  final String correct;
  final Exam exam;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.exam,
  });
}
