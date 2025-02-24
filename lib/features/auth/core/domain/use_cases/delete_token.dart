import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/domain/repositories.dart/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteToken {
  final TokenRepository _repository;

  DeleteToken(this._repository);

  Future<ApiResult<void>> call() => _repository.deleteToken();
}
