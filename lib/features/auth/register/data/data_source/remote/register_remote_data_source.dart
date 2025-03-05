import 'package:exam/features/auth/register/data/models/register_request_dto.dart';
import 'package:exam/features/auth/register/data/models/register_response_dto.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterResponseDto> register(RegisterRequestDto userData);
}
