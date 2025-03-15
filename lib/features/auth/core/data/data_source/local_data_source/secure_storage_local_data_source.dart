import 'package:exam/features/auth/core/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocalDataSource)
class SecureStorageLocalDataSource implements LocalDataSource {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';
  static const String _rememberMeKey = 'remember_me';

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    final token = await secureStorage.read(key: _tokenKey);
    return token;
  }

  @override
  Future<void> deleteToken() async {
    await secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<void> setRememberMe(bool isRememberMe) async {
    await secureStorage.write(key: _rememberMeKey, value: isRememberMe.toString());
  }

  @override
  Future<bool> getRememberMe() async {
    String? value = await secureStorage.read(key: _rememberMeKey);
    return value == 'true';
  }
}
