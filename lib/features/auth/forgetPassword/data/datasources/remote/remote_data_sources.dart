abstract class RemoteDataSources {
  Future<void> enterEmail(String email);
  Future<void> verfiyResetCode(String resetCode);
  Future<void> resetPassword(String email, String password);
}
