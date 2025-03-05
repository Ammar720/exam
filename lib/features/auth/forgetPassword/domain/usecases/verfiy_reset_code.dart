import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/forgetPassword/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerfiyResetCode {
  final ForgetPasswordRepo _repo;
  VerfiyResetCode(this._repo);
  Future<ApiResult<void>> call(String resetCode) =>
      _repo.verfiyResetCode(resetCode);
}
