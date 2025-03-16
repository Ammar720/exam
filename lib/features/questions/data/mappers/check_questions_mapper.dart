import 'package:exam/features/questions/data/mappers/correct_question_mapper.dart';
import 'package:exam/features/questions/data/mappers/wrong_question_mapper.dart';
import 'package:exam/features/questions/data/models/check_questions_response/check_questions_response.dart';

import '../../domain/entities/check_questions_entity.dart';


extension CheckQuestionsMapper on CheckQuestionsResponse {
  CheckQuestionsEntity toEntity() {
    return CheckQuestionsEntity(
      correct: correct,
      wrong: wrong,
      total: total,
      wrongQuestions: wrongQuestions.map((e) => e.toEntity()).toList(),
      correctQuestions: correctQuestions.map((e) => e.toEntity()).toList(),
    );
  }
}
