
import 'package:exam/features/questions/data/models/get_questions_response/question_model.dart';
import 'package:exam/features/questions/domain/entities/question.dart';

extension QuestionMapper on QuestionModel {
  Question toEntity() => Question(
      id: id,
      question: question,
      answers: answers,
      correct: correct,
      );
}
