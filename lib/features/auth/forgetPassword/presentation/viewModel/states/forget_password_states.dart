sealed class ForgetPasswordStates {}

class ForgetPasswordInitial extends ForgetPasswordStates {}

class ForgetPasswordLoading extends ForgetPasswordStates {}

class ForgetPasswordError extends ForgetPasswordStates {
  final String message;
  ForgetPasswordError(this.message);  
} 

class ForgetPasswordSuccess extends ForgetPasswordStates {}