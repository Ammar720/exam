import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/domain/repositories.dart/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetRememberMe {
  final TokenRepository _repository;

  SetRememberMe(this._repository);

  Future<ApiResult<void>> call(bool isRememberMe) {
    return _repository.setRememberMe(isRememberMe);
  }
}
