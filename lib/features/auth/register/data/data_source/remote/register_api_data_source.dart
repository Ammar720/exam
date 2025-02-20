import 'package:exam/core/api_manager/api_manager.dart';
import 'package:exam/core/config/constants.dart';
import 'package:exam/features/auth/register/data/data_source/remote/register_remote_data_source.dart';
import 'package:exam/features/auth/register/data/models/register_request_dto.dart';
import 'package:exam/features/auth/register/data/models/register_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterApiDataSource implements RegisterRemoteDataSource {
  final ApiManager _apiManager;

  RegisterApiDataSource(this._apiManager);
  @override
  Future<RegisterResponseDto> register(RegisterRequestDto userData) async {
    var response = await _apiManager.dio
        .post(ApiConstants.signUpEndpoint, data: userData.toJson());
    return RegisterResponseDto.fromJson(response.data);
  }
}
