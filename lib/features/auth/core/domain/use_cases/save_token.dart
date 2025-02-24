import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/domain/repositories.dart/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveToken {
  final TokenRepository _repository;

  SaveToken(this._repository);

  Future<ApiResult<void>> call(String token) => _repository.saveToken(token);
}
