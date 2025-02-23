import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/domain/use_cases/delete_token.dart';
import 'package:exam/features/auth/core/domain/use_cases/get_token.dart';
import 'package:exam/features/auth/core/domain/use_cases/save_token.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class TokenCubit extends Cubit<String?> {
  final GetToken _getTokenUseCase;
  final SaveToken _saveTokenUseCase;
  final DeleteToken _deleteTokenUseCase;

  TokenCubit(
    this._getTokenUseCase,
    this._saveTokenUseCase,
    this._deleteTokenUseCase,
  ) : super(null);

  Future<void> loadToken() async {
    final result = await _getTokenUseCase();

    if (result is SuccessApiResult<String?>) {
      emit(result.data);
    } else {
      emit(null);
    }
  }

  Future<void> saveToken(String token) async {
    final result = await _saveTokenUseCase(token);
    if (result is SuccessApiResult) {
      emit(token);
    }
  }

  Future<void> deleteToken() async {
    final result = await _deleteTokenUseCase();
    if (result is SuccessApiResult) {
      emit(null);
    }
  }
}
