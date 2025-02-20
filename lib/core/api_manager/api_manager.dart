import 'package:dio/dio.dart';
import 'package:exam/core/config/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
  ));
}
