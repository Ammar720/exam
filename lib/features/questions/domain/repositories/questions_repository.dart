import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/questions/data/models/submit_answers_request.dart';

import 'package:exam/features/questions/domain/entities/check_questions_entity.dart';
import 'package:exam/features/questions/domain/entities/question.dart';

abstract class QuestionsRepository {
  Future<ApiResult<List<Question>>> getQuestions(String examId);
  Future<ApiResult<CheckQuestionsEntity>> checkQuestions(
      SubmitAnswersRequest request);
}
