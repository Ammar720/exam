import 'package:exam/core/api_manager/api_manager.dart';
import 'package:exam/core/config/constants.dart';
import 'package:exam/features/questions/data/datasources/remote/questions_remote_data_source.dart';
import 'package:exam/features/questions/data/models/get_questions_response/get_questions_response.dart';
import 'package:exam/features/questions/data/models/get_questions_response/question_model.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: QuestionsRemoteDataSource)
class QuestionsApiRemoteDataSource implements QuestionsRemoteDataSource {
  final ApiManager apiManager;

  QuestionsApiRemoteDataSource(this.apiManager);
  @override
  Future<List<QuestionModel>> getQuestions(String examId) async {
    final response = await apiManager.dio
        .get(ApiConstants.questionsEndpoint, queryParameters: {"exam": examId});
    final result = GetQuestionsResponse.fromJson(response.data);
    return result.questions;
  }
}
