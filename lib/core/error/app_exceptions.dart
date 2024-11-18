class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, [this.prefix]);

  @override
  String toString() {
    return "${prefix ?? ''}$message";
  }
}

class BadRequestException extends AppException {
  BadRequestException([String message = "Invalid request"])
      : super(message, "Bad Request: ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String message = "Unauthorized request"])
      : super(message, "Unauthorized: ");
}

class ForbiddenException extends AppException {
  ForbiddenException([String message = "Forbidden"])
      : super(message, "Forbidden: ");
}

class NotFoundException extends AppException {
  NotFoundException([String message = "Resource not found"])
      : super(message, "Not Found: ");
}

class InternalServerException extends AppException {
  InternalServerException([String message = "Internal server error"])
      : super(message, "Server Error: ");
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String message = "Service unavailable"])
      : super(message, "Service Unavailable: ");
}

class NoInternetException extends AppException {
  NoInternetException([String message = "No internet connection"])
      : super(message, "No Internet: ");
}

class TimeoutException extends AppException {
  TimeoutException([String message = "Request timed out"])
      : super(message, "Timeout: ");
}

class UnknownException extends AppException {
  UnknownException([String message = "An unknown error occurred"])
      : super(message, "Unknown Error: ");
}
