import 'package:dio/dio.dart';

class DioErrorHandler {
  static String getMessage(DioException error) {
    switch (error.type) {
      case DioException.connectionTimeout:
        return "Connection timeout. Please check your internet connection";
      case DioException.sendTimeout:
        return "Send timeout.Unable to send data. Please try again";
      case DioException.receiveTimeout:
        return "Receive timeout. Unable to get a response from the server";
      case DioException.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode != null) {
          return _handlerHttpError(statusCode);
        }
        return "Unexpected server error. Please try again";
      case DioExceptionType.cancel:
        return "Request was cancelled. Please try again";
      case DioExceptionType.unknown:
        return "An unknown error occured. Please try again";
      default:
        return "An unknown error. Please try again";
    }
  }

  static String _handlerHttpError(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Requrest. Please check your input and try again";
      case 401:
        return "Unauthorized. Please log in again";
      case 403:
        return "Forbidden. You don't have permission to access this resource";
      case 404:
        return "Resource not found. Please check the URL or try again later";
      case 500:
        return "Internal server error. Please try again later";
      case 503:
        return "Service unavailable. Pleasetry again later";
      default:
        return "Unexpected error occurred with status code $statusCode.";
    }
  }
}
