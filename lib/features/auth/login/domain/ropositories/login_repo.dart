import 'package:exam/core/api_manager/api_results.dart';

abstract class LoginRepo {
  Future<ApiResult<void>> login(String email, String password);
}
