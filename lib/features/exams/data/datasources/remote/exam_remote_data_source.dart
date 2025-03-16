import 'package:exam/features/exams/data/models/exam_model.dart';

abstract class ExamRemoteDataSource {
  Future<List<ExamModel>> getExams(String subject);
}
