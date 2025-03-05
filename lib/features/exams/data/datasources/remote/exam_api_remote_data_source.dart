import 'package:exam/core/api_manager/api_manager.dart';
import 'package:exam/core/config/constants.dart';

import 'package:exam/features/exams/data/datasources/remote/exam_remote_data_source.dart';
import 'package:exam/features/exams/data/models/exam_model.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ExamRemoteDataSource)
class ExamApiRemoteDataSource implements ExamRemoteDataSource {
  final ApiManager apiManager;

  ExamApiRemoteDataSource({required this.apiManager});

  @override
  Future<List<ExamModel>> getExams(String subject) async {
    final result = await apiManager.dio.get(
      ApiConstants.examsEndpoint,
      queryParameters: {"subject": subject},
    );
    final exams = result.data["exams"] as List<dynamic>;

    return exams.map((e) => ExamModel.fromJson(e)).toList();
  }
}
