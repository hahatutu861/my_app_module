import 'package:dio/dio.dart';
import 'package:my_app_module/services/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final appException = _mapDioException(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: appException,
      ),
    );
  }

  AppException _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException(message: '连接超时，请检查网络');
      case DioExceptionType.sendTimeout:
        return const NetworkException(message: '发送请求超时');
      case DioExceptionType.receiveTimeout:
        return const NetworkException(message: '接收数据超时，请稍后重试');
      case DioExceptionType.connectionError:
        return const NetworkException(message: '网络连接失败，请检查网络');
      case DioExceptionType.cancel:
        return const NetworkException(message: '请求已取消');
      default:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return const UnauthorizedException(message: '登录已过期，请重新登录');
        } else if (statusCode == 403) {
          return const UnauthorizedException(message: '没有权限访问该资源');
        } else if (statusCode == 404) {
          return const NotFoundException(message: '请求的资源不存在');
        } else if (statusCode != null && statusCode >= 500) {
          return ServerException(message: '服务器错误，请稍后重试', statusCode: statusCode);
        } else {
          return ServerException(
            message: e.message ?? '网络请求失败',
            statusCode: statusCode,
          );
        }
    }
  }
}
