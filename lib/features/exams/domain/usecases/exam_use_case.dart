import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/exams/domain/repositories/exam_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ExamUseCase {
  final ExamRepository _repository;

  ExamUseCase(this._repository);

  Future<ApiResult<List<Exam>>> getExams(String subject) =>
      _repository.getExams(subject);
}
