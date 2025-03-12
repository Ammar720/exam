import 'correct_question_entity.dart';
import 'wrong_question_entity.dart';

class CheckQuestionsEntity {
  final int correct;
  final int wrong;
  final String total;
  final List<WrongQuestionEntity> wrongQuestions;
  final List<CorrectQuestionEntity> correctQuestions;

  const CheckQuestionsEntity({
    required this.correct,
    required this.wrong,
    required this.total,
    required this.wrongQuestions,
    required this.correctQuestions,
  });
}
