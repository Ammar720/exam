import 'package:exam/core/config/constants.dart';
import 'package:exam/features/auth/core/data/data_source/local_data_source/local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocalDataSource)
class SecureStorageLocalDataSource implements LocalDataSource {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: StorageConstants.tokenKey, value: token);
  }

  @override
  Future<String?> getToken() {
    return secureStorage.read(key: StorageConstants.tokenKey);
  }

  @override
  Future<void> deleteToken() {
    return secureStorage.delete(key: StorageConstants.tokenKey);
  }
}
