import 'package:dio/dio.dart';
import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/utils/error_handler.dart';
import 'package:exam/features/auth/core/data/data_source/local_data_source/local_data_source.dart';
import 'package:exam/features/auth/register/data/data_source/remote/register_remote_data_source.dart';
import 'package:exam/features/auth/register/data/models/register_request_dto.dart';
import 'package:exam/features/auth/register/domain/contract/register_repo.dart';
import 'package:exam/features/auth/register/domain/entities/register_request_entity.dart';
import 'package:exam/features/auth/register/domain/entities/register_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  final RegisterRemoteDataSource _registerRemoteDataSource;
  final LocalDataSource _localDataSource;

  RegisterRepoImpl(this._registerRemoteDataSource, this._localDataSource);

  @override
  Future<ApiResult<RegisterResponseEntity>> register(
      RegisterRequestEntity userData) async {
    RegisterRequestDto userDto = RegisterRequestDto.fromEntity(userData);
    try {
      var response = await _registerRemoteDataSource.register(userDto);

      if (response.message == 'success') {
        _localDataSource.saveToken(response.token!);
        return SuccessApiResult(response.toEntity());
      } else {
        String errorMessage = response.message ?? 'Unexpected error';
        return ErrorApiResult(errorMessage);
      }
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['message'] ?? 'Something went wrong';
      return ErrorApiResult(errorMessage);
    } catch (ex) {
      return ErrorApiResult(ErrorHandler.getErrorMessage(ex));
    }
  }
}
