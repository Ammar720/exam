class User {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  const User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
      };
}
