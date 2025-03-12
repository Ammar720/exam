import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/utils/error_handler.dart';

import 'package:exam/features/questions/data/datasources/remote/questions_remote_data_source.dart';
import 'package:exam/features/questions/data/mappers/check_questions_mapper.dart';
import 'package:exam/features/questions/data/mappers/question_mapper.dart';
import 'package:exam/features/questions/data/models/submit_answers_request.dart';

import 'package:exam/features/questions/domain/entities/check_questions_entity.dart';
import 'package:exam/features/questions/domain/entities/question.dart';
import 'package:exam/features/questions/domain/repositories/questions_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: QuestionsRepository)
class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsRemoteDataSource remoteDataSource;
  QuestionsRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<List<Question>>> getQuestions(String examId) async {
    try {
      final result = await remoteDataSource.getQuestions(examId);
      final questions = result.map((e) => e.toEntity()).toList();
      return SuccessApiResult<List<Question>>(questions);
    } catch (exception) {
      return ErrorApiResult<List<Question>>(
          ErrorHandler.getErrorMessage(exception));
    }
  }

  @override
  Future<ApiResult<CheckQuestionsEntity>> checkQuestions(
      SubmitAnswersRequest request) async {
    try {
      final result = await remoteDataSource.checkQuestions(request);
      return SuccessApiResult<CheckQuestionsEntity>(result.toEntity());
    } catch (exception) {
      return ErrorApiResult<CheckQuestionsEntity>(
          ErrorHandler.getErrorMessage(exception));
    }
  }
}
