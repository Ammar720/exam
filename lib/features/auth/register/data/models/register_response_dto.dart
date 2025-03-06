import 'package:exam/features/auth/register/data/models/user_model.dart';
import 'package:exam/features/auth/register/domain/entities/register_response_entity.dart';

class RegisterResponseDto {
  final String? message;
  final String? token;
  final UserModel? user;

  const RegisterResponseDto({this.message, this.token, this.user});

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDto(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
      };

  RegisterResponseEntity toEntity() =>
      RegisterResponseEntity(message, token, user!.toUser());
}
