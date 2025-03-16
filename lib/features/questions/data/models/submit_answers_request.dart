class SubmitAnswersRequest {
  final List<AnswerRequest> answers;
  final int time;

  SubmitAnswersRequest({
    required this.answers,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      "answers": answers.map((answer) => answer.toJson()).toList(),
      "time": time,
    };
  }
}

class AnswerRequest {
  final String questionId;
  final String? correct;

  AnswerRequest({
    required this.questionId,
    required this.correct,
  });

  Map<String, dynamic> toJson() {
    return {
      "questionId": questionId,
      "correct": correct ?? "null",
    };
  }
}
