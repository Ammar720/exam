import 'package:dio/dio.dart';
import 'package:exam/core/api_manager/api_manager.dart';
import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/config/constants.dart';
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/remote_data_sources.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: RemoteDataSources)
class ApiRemoteDataSource implements RemoteDataSources {
  final ApiManager _apiManager;

  ApiRemoteDataSource(this._apiManager);
  @override
  Future<ApiResult<void>> forgetPassword(String email) async {
    try {
      await _apiManager.dio.post(
        ApiConstants.forgotPasswordEndpoint,
        data: {"email": email},
      );
      return SuccessApiResult(null);
    } on DioException catch (exeption) {
      return ErrorApiResult(Exception(exeption.response!.data["message"]));
    }
  }
}
