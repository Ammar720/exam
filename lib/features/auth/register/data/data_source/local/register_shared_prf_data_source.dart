import 'package:exam/core/config/constants.dart';
import 'package:exam/features/auth/register/data/data_source/local/register_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: RegisterLocalDataSource)
class RegisterSharedPrfDataSource implements RegisterLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrfConstants.tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPrfConstants.tokenKey);
    return token;
  }
}
