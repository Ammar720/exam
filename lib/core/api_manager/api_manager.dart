import 'package:dio/dio.dart';
import 'package:exam/core/api_manager/api_results.dart';
import 'package:exam/core/config/constants.dart';
import 'package:exam/core/di/di.dart';
import 'package:exam/features/auth/core/domain/use_cases/get_token.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  ApiManager() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final getTokenUseCase = getIt<GetToken>();
        final result = await getTokenUseCase();

        if (result is SuccessApiResult<String?>) {
          final token = result.data;
          if (token != null) {
            options.headers[StorageConstants.tokenKey] = token;
          }
        }

        return handler.next(options);
      },
    ));
  }
}
