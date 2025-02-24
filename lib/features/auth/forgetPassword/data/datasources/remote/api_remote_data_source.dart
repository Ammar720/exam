import 'package:exam/core/api_manager/api_manager.dart';
import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/config/constants.dart';
import 'package:exam/features/auth/core/data/data_source/local_data_source/local_data_source.dart';

import 'package:exam/features/auth/forgetPassword/data/datasources/remote/remote_data_sources.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSources)
class ApiRemoteDataSource implements RemoteDataSources {
  final ApiManager _apiManager;
  final LocalDataSource _localDataSource;

  ApiRemoteDataSource(this._apiManager, this._localDataSource);

  @override
  Future<void> enterEmail(String email) async {
    await _apiManager.dio.post(
      ApiConstants.forgotPasswordEndpoint,
      data: {"email": email},
    );
  }

  @override
  Future<void> verfiyResetCode(String resetCode) async {
    await _apiManager.dio.post(
      ApiConstants.verifyResetCodeEndpoint,
      data: {"resetCode": resetCode},
    );
    SuccessApiResult(null);
  }

  @override
  Future<void> resetPassword(String email, String password) async {
    final result = await _apiManager.dio.put(
      ApiConstants.resetPasswordEndpoint,
      data: {
        "email": email,
        "newPassword": password,
      },
    );
    await _localDataSource.saveToken(result.data["token"]);
  }
}
