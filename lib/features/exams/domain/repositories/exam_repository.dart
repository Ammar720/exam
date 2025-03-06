import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';

abstract class ExamRepository {
  Future<ApiResult<List<Exam>>> getExams(String subject);
}
