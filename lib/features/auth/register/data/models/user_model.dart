import 'package:exam/features/auth/register/domain/entities/user.dart';

class UserModel {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? id;
  final DateTime? createdAt;

  const UserModel({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        role: json['role'] as String?,
        isVerified: json['isVerified'] as bool?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'role': role,
        'isVerified': isVerified,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
      };

  //  from UserModel to User Entity
  User toUser() {
    return User(
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
  }
}
