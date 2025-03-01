abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginError extends LoginStates {
  final String message;
  LoginError(this.message);
}
