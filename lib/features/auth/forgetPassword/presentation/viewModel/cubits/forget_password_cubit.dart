import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/forgetPassword/domain/usecases/enter_email.dart';
import 'package:exam/features/auth/forgetPassword/domain/usecases/verfiy_reset_code.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/states/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  final EnterEmail _enterEmail;
  final VerfiyResetCode _verfiyResetCode;
  ForgetPasswordCubit(
    this._enterEmail,
    this._verfiyResetCode,
  ) : super(ForgetPasswordInitial());

  Future<void> enterEmail(String email, {bool isResend = false}) async {
    emit(ForgetPasswordLoading());
    final result = await _enterEmail(email);
    if (result is SuccessApiResult) {
      if (isResend) {
        emit(ResendOTPSuccess());
      } else {
        emit(ForgetPasswordSuccess());
      }
    } else if (result is ErrorApiResult) {
      emit(ForgetPasswordError(result.exception.toString()));
    }
  }

  Future<void> verfiyResetCode(String resetCode) async {
    emit(ForgetPasswordLoading());
    final result = await _verfiyResetCode(resetCode);
    if (result is SuccessApiResult) {
      emit(ForgetPasswordSuccess());
    } else if (result is ErrorApiResult) {
      emit(ForgetPasswordError(result.exception.toString()));
    }
  }
}
