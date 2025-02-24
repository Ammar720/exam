import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/utils/error_handler.dart';
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/remote_data_sources.dart';
import 'package:exam/features/auth/forgetPassword/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final RemoteDataSources _remoteDataSources;

  ForgetPasswordRepoImpl(this._remoteDataSources);

  @override
  Future<ApiResult<void>> enterEmail(String email) async {
    try {
      await _remoteDataSources.enterEmail(email);
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult(ErrorHandler.getErrorMessage(error));
    }
  }

  @override
  Future<ApiResult<void>> verfiyResetCode(String resetCode) async {
    try {
      await _remoteDataSources.verfiyResetCode(resetCode);
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult(ErrorHandler.getErrorMessage(error));
    }
  }

  @override
  Future<ApiResult<void>> resetPassword(String email, String password) async {
    try {
      await _remoteDataSources.resetPassword(email, password);
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult(ErrorHandler.getErrorMessage(error));
    }
  }
}
