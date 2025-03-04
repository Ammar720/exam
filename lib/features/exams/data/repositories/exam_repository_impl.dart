import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/utils/error_handler.dart';
import 'package:exam/features/exams/data/datasources/remote/exam_remote_data_source.dart';
import 'package:exam/features/exams/data/mappers/exam_mapper.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/exams/domain/repositories/exam_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  final ExamRemoteDataSource remoteDataSource;
  ExamRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<List<Exam>>> getExams(String subject) async {
    try {
      final result = await remoteDataSource.getExams(subject);
      final exams = result.map((e) => e.toEntity()).toList();
      return SuccessApiResult<List<Exam>>(exams);
    } catch (exception) {
      return ErrorApiResult<List<Exam>>(
          ErrorHandler.getErrorMessage(exception));
    }
  }
}
