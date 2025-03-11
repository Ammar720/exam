import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/questions/domain/entities/question.dart';
import 'package:exam/features/questions/domain/usecases/get_questions_use_case.dart';
import 'package:exam/features/questions/presentation/cubit/questions_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class QuestionsCubit extends Cubit<QuestionsStates> {
  final GetQuestionsUseCase getQuestionsUseCase;
  List<Question> _questions = [];
  int _questionIndex = 0;
  final Map<int, int?> _selectedAnswers = {}; 

  QuestionsCubit(this.getQuestionsUseCase) : super(QuestionsInitial());

  Future<void> getQuestions(String examId) async {
    emit(QuestionsLoading());
    final result = await getQuestionsUseCase(examId);
    if (result is SuccessApiResult<List<Question>>) {
      _questions = result.data!;
      _questionIndex = 0;
      _selectedAnswers.clear(); 
      emit(QuestionsSuccess(_questions, _questionIndex, _selectedAnswers));
    } else if (result is ErrorApiResult<List<Question>>) {
      emit(QuestionsError(result.exception));
    }
  }

  void selectAnswer(int answerIndex) {
    _selectedAnswers[_questionIndex] = answerIndex; 
    emit(QuestionsSuccess(_questions, _questionIndex, _selectedAnswers));
  }

  void goToNextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
      emit(QuestionsSuccess(_questions, _questionIndex, _selectedAnswers));
    }
  }

  void goToPreviousQuestion() {
    if (_questionIndex > 0) {
      _questionIndex--;
      emit(QuestionsSuccess(_questions, _questionIndex, _selectedAnswers));
    }
  }
}
