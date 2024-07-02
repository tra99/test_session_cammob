enum ExceptionType {
  requestCancelled,
  requestTimeout,
  noInternetConnection,
  timeout,
  unauthorisedRequest,
  badRequest,
  notFound,
  internalServerError,
  serviceUnavailable,
  unknownError,
  formatException
}

extension ExceptionTypeExtension on ExceptionType {
  String message() {
    switch (this) {
      case ExceptionType.requestCancelled:
        return "The request was cancelled.";
      case ExceptionType.requestTimeout:
        return "The request timed out.";
      case ExceptionType.noInternetConnection:
        return "No internet connection.";
      case ExceptionType.timeout:
        return "The request timed out.";
      case ExceptionType.unauthorisedRequest:
        return "The request is unauthorised.";
      case ExceptionType.badRequest:
        return "Bad request.";
      case ExceptionType.notFound:
        return "Resource not found.";
      case ExceptionType.internalServerError:
        return "Internal server error.";
      case ExceptionType.serviceUnavailable:
        return "Service unavailable.";
      case ExceptionType.unknownError:
        return "Unknown error.";
      case ExceptionType.formatException:
        return "Format exception.";
      default:
        return "An unknown exception occurred.";
    }
  }
}
