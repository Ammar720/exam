import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/forgetPassword/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class ForgetPassword {
  final ForgetPasswordRepo _repo;
  ForgetPassword(this._repo);

  Future<ApiResult<void>> call(String email) => _repo.forgetPassword(email);
}
