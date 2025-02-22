import 'package:dio/dio.dart';

class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else if (error is Exception) {
      return error.toString().replaceFirst("Exception: ", ""); 
    } else {
      return "Something went wrong. Please try again.";
    }
  }

  static String _handleDioException(DioException exception) {
    if (exception.type == DioExceptionType.connectionError) {
      return "No internet connection";
    }
    if (exception.response != null &&
        exception.response!.data is Map<String, dynamic> &&
        exception.response!.data["message"] is String) {
      return exception.response!.data["message"];
    }
    return "Something went wrong. Please try again.";
  }
}
