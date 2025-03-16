abstract class QuestionsStates {}

class QuestionsInitial extends QuestionsStates {}

class QuestionsLoading extends QuestionsStates {}

class QuestionsError extends QuestionsStates {
  final String message;
  QuestionsError(this.message);
}

class QuestionsSuccess<T> extends QuestionsStates {
  final T questions;
  final int? questionIndex ;
  final Map<int, int?>? selectedAnswers;

  QuestionsSuccess(this.questions, {this.questionIndex , this.selectedAnswers});
}
