import 'package:exam/features/questions/data/models/get_questions_response/question_model.dart';

abstract class QuestionsRemoteDataSource {
  Future<List<QuestionModel>> getQuestions(String examId);
}
