class ExamModel {
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final DateTime createdAt;

  const ExamModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
        id: json['_id'] as String,
        title: json['title'] as String,
        duration: json['duration'] as int,
        subject: json['subject'] as String,
        numberOfQuestions: json['numberOfQuestions'] as int,
        active: json['active'] as bool,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );
}
