import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/questions/data/models/submit_answers_request.dart';
import 'package:exam/features/questions/domain/entities/check_questions_entity.dart';
import 'package:exam/features/questions/domain/repositories/questions_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class CheckQuestionsUseCase {
  final QuestionsRepository repository;
  CheckQuestionsUseCase(this.repository);

  Future<ApiResult<CheckQuestionsEntity>> call(SubmitAnswersRequest request) =>
      repository.checkQuestions(request);
}