import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/questions/domain/entities/question.dart';
import 'package:exam/features/questions/domain/repositories/questions_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetQuestionsUseCase {
  final QuestionsRepository repository;
  GetQuestionsUseCase(this.repository);

  Future<ApiResult<List<Question>>> call(String examId) =>
      repository.getQuestions(examId);
}
