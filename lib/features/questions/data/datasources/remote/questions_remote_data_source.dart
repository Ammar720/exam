import 'package:exam/features/questions/data/models/check_questions_response/check_questions_response.dart';
import 'package:exam/features/questions/data/models/get_questions_response/question_model.dart';
import 'package:exam/features/questions/data/models/submit_answers_request.dart';

abstract class QuestionsRemoteDataSource {
  Future<List<QuestionModel>> getQuestions(String examId);
  Future<CheckQuestionsResponse> checkQuestions(SubmitAnswersRequest request);
}
