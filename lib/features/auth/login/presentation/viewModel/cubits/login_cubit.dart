import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:exam/features/auth/login/presentation/viewModel/states/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginCubit extends Cubit<LoginStates> {
  final LoginUsecase _loginUsecase;

  LoginCubit(this._loginUsecase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await _loginUsecase(email, password);

    if (result is SuccessApiResult) {
      emit(LoginSuccess());
    } else if (result is ErrorApiResult) {
      emit(LoginError(result.exception.toString()));
    }
  }
}
