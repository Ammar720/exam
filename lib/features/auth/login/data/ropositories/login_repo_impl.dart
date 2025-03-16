import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/utils/error_handler.dart';
import 'package:exam/features/auth/login/data/datasources/remote_datasource.dart';
import 'package:exam/features/auth/login/domain/ropositories/login_repo.dart';
import 'package:injectable/injectable.dart';

// @override
// Future<ApiResult<void>> enterEmail(String email) async {
//   try {
//     await _remoteDataSources.enterEmail(email);
//     return SuccessApiResult(null);
//   } catch (error) {
//     return ErrorApiResult(ErrorHandler.getErrorMessage(error));
//   }
// }

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final RemoteDatasource _remoteDatasource;

  LoginRepoImpl(this._remoteDatasource);

  @override
  Future<ApiResult<void>> login(String email, String password) async {
    try {
      await _remoteDatasource.login(email, password);
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult(ErrorHandler.getErrorMessage(error));
    }
  }
}
