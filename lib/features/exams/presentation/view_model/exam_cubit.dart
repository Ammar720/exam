import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/exams/domain/usecases/exam_use_case.dart';
import 'package:exam/features/exams/presentation/view_model/exam_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ExamCubit extends Cubit<ExamStates> {
  final ExamUseCase exam;
  ExamCubit(this.exam) : super(ExamInitial());

  Future<void> getExams(String subject) async {
    emit(ExamLoading());
    final result = await exam.getExams(subject);
    if (result is SuccessApiResult<List<Exam>>) {
      emit(ExamSuccess(result.data!));
    } else if (result is ErrorApiResult<List<Exam>>) {
      emit(ExamError(result.exception));
    }
  }
}
