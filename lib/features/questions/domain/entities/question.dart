import 'package:exam/features/questions/data/models/get_questions_response/answer.dart';

class Question {
  final String id;
  final String question;
  final List<Answer> answers;
  final String correct;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
  });
}
