
import 'package:exam/features/questions/data/models/check_questions_response/wrong_question_model.dart';

import '../../domain/entities/wrong_question_entity.dart';

extension WrongQuestionMapper on WrongQuestionModel {
  WrongQuestionEntity toEntity() {
    return WrongQuestionEntity(
      qid: qid,
      question: question,
      inCorrectAnswer: inCorrectAnswer,
      correctAnswer: correctAnswer,
    );
  }
}
