import 'package:exam/features/questions/data/models/check_questions_response/correct_question_model.dart';

import '../../domain/entities/correct_question_entity.dart';

extension CorrectQuestionMapper on CorrectQuestionModel {
  CorrectQuestionEntity toEntity() {
    return CorrectQuestionEntity(
      qid: qid,
      question: question,
      correctAnswer: correctAnswer,
    );
  }
}
