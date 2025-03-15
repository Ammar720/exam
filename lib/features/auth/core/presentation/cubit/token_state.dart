class TokenState {
  final String? token;
  final bool rememberMe;

  TokenState({required this.token, required this.rememberMe});

  TokenState copyWith({String? token, bool? rememberMe}) {
    return TokenState(
      token: token ?? this.token,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
