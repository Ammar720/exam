import 'package:exam/features/auth/core/domain/use_cases/set_remember.dart';
import 'package:exam/features/auth/core/presentation/cubit/token_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/core/domain/use_cases/get_remember_me.dart';
import 'package:exam/features/auth/core/domain/use_cases/get_token.dart';
import 'package:exam/features/auth/core/domain/use_cases/save_token.dart';
import 'package:exam/features/auth/core/domain/use_cases/delete_token.dart';

@injectable
class TokenCubit extends Cubit<TokenState> {
  final GetToken _getTokenUseCase;
  final SaveToken _saveTokenUseCase;
  final DeleteToken _deleteTokenUseCase;
  final SetRememberMe _setRememberMeUseCase;
  final GetRememberMe _getRememberMeUseCase;

  TokenCubit(
    this._getTokenUseCase,
    this._saveTokenUseCase,
    this._deleteTokenUseCase,
    this._setRememberMeUseCase,
    this._getRememberMeUseCase,
  ) : super(TokenState(token: null, rememberMe: false));

  Future<void> loadToken() async {
    final rememberMeResult = await _getRememberMeUseCase();
    final rememberMe = (rememberMeResult is SuccessApiResult<bool>)
        ? rememberMeResult.data ?? false
        : false;

    final tokenResult = await _getTokenUseCase();
    final token =
        (tokenResult is SuccessApiResult<String?>) ? tokenResult.data : null;

    if (token == null && rememberMe) {}

    emit(TokenState(token: token, rememberMe: rememberMe));
  }

  Future<void> saveToken(String token) async {
    if (state.rememberMe) {
      await _setRememberMeUseCase(true);
      await _saveTokenUseCase(token);
      emit(state.copyWith(token: token));
    }
  }

  Future<void> deleteToken() async {
    await _setRememberMeUseCase(false);
    await _deleteTokenUseCase();
    emit(TokenState(token: null, rememberMe: false));
  }

  Future<void> toggleRememberMe() async {
    final newRememberMe = !state.rememberMe;
    await _setRememberMeUseCase(newRememberMe);
    emit(state.copyWith(rememberMe: newRememberMe));
  }
}
