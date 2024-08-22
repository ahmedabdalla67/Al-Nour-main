//!ServerException
import 'package:dio/dio.dart';
import 'package:mesk/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}

//!CacheException
class CacheException implements Exception {
  final String errorMessage;

  CacheException({required this.errorMessage});
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class BadResponseException extends ServerException {
  BadResponseException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.errorModel);
}

class CofficientException extends ServerException {
  CofficientException(super.errorModel);
}

class CancelException extends ServerException {
  CancelException(super.errorModel);
}

class UnknownException extends ServerException {
  UnknownException(super.errorModel);
}

handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw CancelException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      switch (e.response!.statusCode) {
        case 400: // Bad Request
          throw BadResponseException(ErrorModel.fromJson(e.response!.data));
        case 401: // Unauthorized
          throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));
        case 403: //Forbidden
          throw ForbiddenException(ErrorModel.fromJson(e.response!.data));
        case 404: //NotFound
          throw NotFoundException(ErrorModel.fromJson(e.response!.data));
        case 409: //Cofficient
          throw CofficientException(ErrorModel.fromJson(e.response!.data));
        case 504: //Forbidden
          throw BadResponseException(
              ErrorModel(status: 504, errMessage: e.response!.data));
      }
    case DioExceptionType.badResponse:
      throw BadResponseException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw UnknownException(ErrorModel.fromJson(e.response!.data));
  }
}
