import 'package:exam/core/api_manager/api_manager.dart';
import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/config/constants.dart';
import 'package:exam/core/utils/error_handler.dart';
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/remote_data_sources.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSources)
class ApiRemoteDataSource implements RemoteDataSources {
  final ApiManager _apiManager;

  ApiRemoteDataSource(this._apiManager);

  @override
  Future<ApiResult<void>> enterEmail(String email) async {
    try {
      await _apiManager.dio.post(
        ApiConstants.forgotPasswordEndpoint,
        data: {"email": email},
      );
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult(Exception(ErrorHandler.getErrorMessage(error)));
    }
  }

  @override
  Future<ApiResult<void>> verfiyResetCode(String resetCode) async {
    try {
      await _apiManager.dio.post(
        ApiConstants.verifyResetCodeEndpoint,
        data: {"resetCode": resetCode},
      );
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult(Exception(ErrorHandler.getErrorMessage(error)));
    }
  }
}
