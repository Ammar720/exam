import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/register/domain/entities/register_request_entity.dart';
import 'package:exam/features/auth/register/domain/entities/register_response_entity.dart';
import 'package:exam/features/auth/register/domain/usecase/register_usecase.dart';
import 'package:exam/features/auth/register/presentation/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase)
      : super(RegisterState(status: Status.loading));

  void register(RegisterRequestEntity userData) async {
    emit(state.copyWith(status: Status.loading, exception: null));
    try {
      await Future.delayed(Duration(seconds: 5));
      var result = await _registerUseCase.invoke(userData);

      if (result is SuccessApiResult<RegisterResponseEntity>) {
        emit(state.copyWith(status: Status.success, exception: null));
      } else if (result is ErrorApiResult<RegisterResponseEntity>) {
        emit(state.copyWith(status: Status.error, exception: result.exception));
      }
    } on Exception catch (ex) {
      emit(state.copyWith(status: Status.error, exception: ex));
    }
  }
}
