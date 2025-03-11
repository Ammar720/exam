import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/login/domain/ropositories/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepo _loginRepo;
  LoginUsecase(this._loginRepo);

  Future<ApiResult<void>> call(String email, String password) =>
      _loginRepo.login(email, password);
}
