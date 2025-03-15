abstract class LocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<void> setRememberMe(bool isRememberMe);
  Future<bool> getRememberMe();
}
