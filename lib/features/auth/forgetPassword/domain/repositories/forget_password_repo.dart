import 'package:exam/core/api_manager/api_results.dart';

abstract class ForgetPasswordRepo {
  Future<ApiResult<void>> forgetPassword(String email);
}