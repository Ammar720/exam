import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/domain/repositories.dart/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRememberMe {
  final TokenRepository _repository;

  GetRememberMe(this._repository);

  Future<ApiResult<bool>> call() {
    return _repository.getRememberMe();
  }
}
