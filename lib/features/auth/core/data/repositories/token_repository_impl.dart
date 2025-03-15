import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/data/data_source/local_data_source/local_data_source.dart';
import 'package:exam/features/auth/core/domain/repositories.dart/token_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  final LocalDataSource _localDataSource;

  TokenRepositoryImpl(this._localDataSource);

  @override
  Future<ApiResult<void>> saveToken(String token) async {
    try {
      await _localDataSource.saveToken(token);
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult("Failed to save token");
    }
  }

  @override
  Future<ApiResult<String?>> getToken() async {
    try {
      final token = await _localDataSource.getToken();
      return SuccessApiResult(token);
    } catch (error) {
      return ErrorApiResult("Failed to retrieve token");
    }
  }

  @override
  Future<ApiResult<void>> deleteToken() async {
    try {
      await _localDataSource.deleteToken();
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult("Failed to delete token");
    }
  }

  @override
  Future<ApiResult<void>> setRememberMe(bool isRememberMe) async {
    try {
      await _localDataSource.setRememberMe(isRememberMe);
      return SuccessApiResult(null);
    } catch (error) {
      return ErrorApiResult("Failed to save Remember Me preference");
    }
  }

  @override
  Future<ApiResult<bool>> getRememberMe() async {
    try {
      final isRememberMe = await _localDataSource.getRememberMe();
      return SuccessApiResult(isRememberMe);
    } catch (error) {
      return ErrorApiResult("Failed to retrieve Remember Me preference");
    }
  }
}
