import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/register/domain/entities/register_request_entity.dart';
import 'package:exam/features/auth/register/domain/entities/register_response_entity.dart';

abstract class RegisterRepo {
  Future<ApiResult<RegisterResponseEntity>> register(
      RegisterRequestEntity userData);
}
