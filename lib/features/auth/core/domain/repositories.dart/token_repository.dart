import 'package:exam/core/api_manager/api_results.dart';

abstract class TokenRepository {
  Future<ApiResult<void>> saveToken(String token);
  Future<ApiResult<String?>> getToken();
  Future<ApiResult<void>> deleteToken();
}
