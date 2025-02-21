import 'package:exam/core/config/constants.dart';
import 'package:exam/features/auth/register/data/data_source/local/register_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterLocalDataSource)
class RegisterSecureStorageDataSource implements RegisterLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    final storage = FlutterSecureStorage();
    storage.write(key: StorageConstants.tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: StorageConstants.tokenKey);
    return token;
  }
}
