import 'package:exam/core/api_manager/api_manager.dart';
import 'package:exam/core/config/constants.dart';
import 'package:exam/features/auth/core/data/data_source/local_data_source/local_data_source.dart';
import 'package:exam/features/auth/login/data/datasources/remote_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDatasource)
class ApiRemoteDatasource implements RemoteDatasource {
  final ApiManager _apiManager;
  final LocalDataSource _localDataSource;

  ApiRemoteDatasource(this._apiManager, this._localDataSource);
  @override
  Future<void> login(String email, String password) async {
    final result = await _apiManager.dio.post(ApiConstants.loginEndpoint,
        data: {"email": email, "password": password});
    await _localDataSource.saveToken(result.data["token"]);
  }
}
