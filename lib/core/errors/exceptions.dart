// ignore_for_file: unused_element

import '../utils/constants.dart';

class ServerException implements Exception {
  final String? message;

  ServerException({
    this.message = EXCEPTION_UNKNOWN,
  });

  static ServerException _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        throw ServerException(message: EXCEPTION_UNKNOWN);
      case 404:
        throw ServerException(message: EXCEPTION_NOT_FOUND);
      case 405:
        throw ServerException(message: EXCEPTION_METHOD);
      case 415:
        throw ServerException(message: EXCEPTION_MEDIA_TYPE);
      case 422:
        throw ServerException(message: EXCEPTION_UNKNOWN);
      case 500:
        throw ServerException(message: EXCEPTION_ISE);
      default:
        throw ServerException(message: EXCEPTION_UNKNOWN);
    }
  }
}

class AuthException implements Exception {
  final String? message;

  AuthException({
    this.message = EXCEPTION_UNKNOWN,
  });

  static AuthException _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        throw ServerException(message: EXCEPTION_UNKNOWN);
      case 401:
        throw AuthException(message: EXCEPTION_AUTH_INVALID);
      case 404:
        throw AuthException(message: EXCEPTION_NOT_FOUND);
      case 405:
        throw AuthException(message: EXCEPTION_METHOD);
      case 422:
        throw AuthException(message: EXCEPTION_AUTH_INVALID);
      case 500:
        throw AuthException(message: EXCEPTION_ISE);
      default:
        throw AuthException(message: EXCEPTION_UNKNOWN);
    }
  }
}

class CacheException implements Exception {
  final String? message;

  CacheException({this.message = EXCEPTION_UNKNOWN});
}

class UnknownException implements Exception {
  final String? message;

  UnknownException({this.message});
}

class NotFoundException implements Exception {
  final String? message;

  NotFoundException({this.message});
}
