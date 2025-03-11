import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/questions/domain/entities/question.dart';

abstract class QuestionsRepository {
  Future <ApiResult<List<Question>>> getQuestions(String examId);
}