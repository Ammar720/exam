import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/forgetPassword/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPassword {
  final ForgetPasswordRepo _repo;

  ResetPassword(this._repo);

  Future<ApiResult<void>> call(String email, String password) =>
      _repo.resetPassword(email, password);
}
