class Subject {
  final String id;
  final String name;
  final String icon;
  final String createdAt;

  Subject({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['_id'],
      name: json['name'],
      icon: json['icon'],
      createdAt: json['createdAt'],
    );
  }
}