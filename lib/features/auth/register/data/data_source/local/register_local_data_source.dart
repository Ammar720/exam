abstract class RegisterLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}
