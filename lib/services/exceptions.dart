/// 异常基类
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});

  @override
  String toString() => message;
}

/// 服务器异常
class ServerException extends AppException {
  const ServerException({required super.message, super.statusCode});
}

/// 网络异常
class NetworkException extends AppException {
  const NetworkException({required super.message});
}

/// 缓存异常
class CacheException extends AppException {
  const CacheException({required super.message});
}

/// 未授权异常
class UnauthorizedException extends AppException {
  const UnauthorizedException({required super.message});
}

/// 未找到异常
class NotFoundException extends AppException {
  const NotFoundException({required super.message});
}
