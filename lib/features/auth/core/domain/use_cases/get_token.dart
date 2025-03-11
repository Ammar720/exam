import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/domain/repositories.dart/token_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetToken {
  final TokenRepository _repository;

  GetToken(this._repository);

  Future<ApiResult<String?>> call() async {
    final result = await _repository.getToken();
    return result;
  }
}
