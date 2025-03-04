import 'package:exam/features/exams/domain/entities/exam.dart';

abstract class ExamStates {}

class ExamInitial extends ExamStates {}

class ExamLoading extends ExamStates {}

class ExamSuccess extends ExamStates {
  final List<Exam> exams;
  ExamSuccess(this.exams);
}

class ExamError extends ExamStates {
  final String message;
  ExamError(this.message);
}
