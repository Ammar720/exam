import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/forgetPassword/domain/usecases/forget_password.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/states/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  final ForgetPassword  _forgetPassword ;
  ForgetPasswordCubit(this._forgetPassword) : super(ForgetPasswordInitial());

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    final result = await _forgetPassword(email);
  if (result is SuccessApiResult) {
    emit(ForgetPasswordSuccess());
  } else if (result is ErrorApiResult) {
    emit(ForgetPasswordError(result.exception.toString()));
  }
} 
}