import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/remote_data_sources.dart';
import 'package:exam/features/auth/forgetPassword/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final RemoteDataSources _remoteDataSources;
  ForgetPasswordRepoImpl(this._remoteDataSources);

  @override
  Future<ApiResult<void>> forgetPassword(String email) {
    return _remoteDataSources.forgetPassword(email);
  }
}
