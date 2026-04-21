import 'package:dio/dio.dart';
import 'package:my_app_module/services/exceptions.dart';

abstract class BaseRepository {
  final Dio _dio;

  BaseRepository(this._dio);

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? parser,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        if (parser != null) {
          return parser(response.data);
        }
        return response.data as T;
      } else {
        throw ServerException(
          message: '请求失败',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.error is AppException) {
        rethrow;
      }
      throw ServerException(
        message: e.message ?? '网络请求失败',
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? parser,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (parser != null) {
          return parser(response.data);
        }
        return response.data as T;
      } else {
        throw ServerException(
          message: '请求失败',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.error is AppException) {
        rethrow;
      }
      throw ServerException(
        message: e.message ?? '网络请求失败',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
