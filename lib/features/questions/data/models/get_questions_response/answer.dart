class Answer {
  final String answer;
  final String key;

  Answer({
    required this.answer,
    required this.key,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answer: json['answer'],
      key: json['key'],
    );
  }
}
