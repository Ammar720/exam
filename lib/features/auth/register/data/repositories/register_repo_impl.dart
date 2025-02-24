import 'package:dio/dio.dart';
import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/features/auth/register/data/data_source/local/register_local_data_source.dart';
import 'package:exam/features/auth/register/data/data_source/remote/register_remote_data_source.dart';
import 'package:exam/features/auth/register/data/models/register_request_dto.dart';
import 'package:exam/features/auth/register/domain/contract/register_repo.dart';
import 'package:exam/features/auth/register/domain/entities/register_request_entity.dart';
import 'package:exam/features/auth/register/domain/entities/register_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  final RegisterRemoteDataSource _registerRemoteDataSource;
  final RegisterLocalDataSource _registerLocalDataSource;

  RegisterRepoImpl(
      this._registerRemoteDataSource, this._registerLocalDataSource);

  @override
  Future<ApiResult<RegisterResponseEntity>> register(
      RegisterRequestEntity userData) async {
    RegisterRequestDto userDto = RegisterRequestDto.fromEntity(userData);
    try {
      var response = await _registerRemoteDataSource.register(userDto);

      if (response.message == 'success') {
        _registerLocalDataSource.saveToken(response.token!);
        return SuccessApiResult(response.toEntity());
      } else {
        String errorMessage = response.message ?? 'Unexpected error';
        return ErrorApiResult(Exception(errorMessage));
      }
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['message'] ?? 'Something went wrong';
      return ErrorApiResult(Exception(errorMessage));
    } catch (ex) {
      return ErrorApiResult(Exception(ex));
    }
  }
}
