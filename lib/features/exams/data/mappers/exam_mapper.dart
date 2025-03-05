import 'package:exam/features/exams/data/models/exam_model.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';

extension ExamMapper on ExamModel {
  Exam toEntity() => Exam(
      id: id,
      title: title,
      duration: duration,
      numberOfQuestions: numberOfQuestions);
}
