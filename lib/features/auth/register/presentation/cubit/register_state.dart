import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final Status status;
  final Exception? exception;

  const RegisterState({required this.status, this.exception});

  @override
  List<Object?> get props => [status, exception];

  RegisterState copyWith({
    Status? status,
    Exception? exception,
  }) {
    return RegisterState(
      status: status ?? this.status,
      exception: exception,
    );
  }
}

enum Status {
  initial,
  loading,
  success,
  error,
}
