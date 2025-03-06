import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/register/domain/contract/register_repo.dart';
import 'package:exam/features/auth/register/domain/entities/register_request_entity.dart';
import 'package:exam/features/auth/register/domain/entities/register_response_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final RegisterRepo _registerRepo;

  RegisterUseCase(this._registerRepo);

  Future<ApiResult<RegisterResponseEntity>> invoke(
      RegisterRequestEntity userData) async {
    var response = await _registerRepo.register(userData);
    return response;
  }
}
