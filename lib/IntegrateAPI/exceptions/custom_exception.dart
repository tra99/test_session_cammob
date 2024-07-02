import '../model/exception.dart';

class CustomException implements Exception {
  final ExceptionType exceptionType;

  CustomException(this.exceptionType);

  String errorMessage() {
    return exceptionType.message();
  }

  @override
  String toString() {
    return errorMessage();
  }
}
