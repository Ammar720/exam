import 'package:exam/features/auth/register/domain/entities/user.dart';

class RegisterResponseEntity {
  final String? message;
  final String? token;
  final User? user;

  RegisterResponseEntity(this.message, this.token, this.user);
}
