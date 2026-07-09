import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  static const String _tag = '[HTTP]';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final log = StringBuffer()
      ..writeln('$_tag ╔══════════ REQUEST ═══════════')
      ..writeln('$_tag ║ ${options.method} ${options.uri}')
      ..writeln('$_tag ║ Headers: ${_formatHeaders(options.headers)}')
      ..writeln('$_tag ║ Query:  ${options.queryParameters}');
    if (options.data != null) {
      log.writeln('$_tag ║ Body:   ${options.data}');
    }
    log.writeln('$_tag ╚═══════════════════════════════');
    debugPrint(log.toString());
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final log = StringBuffer()
      ..writeln('$_tag ╔══════════ RESPONSE ══════════')
      ..writeln('$_tag ║ ${response.statusCode} ${response.requestOptions.uri}')
      ..writeln('$_tag ║ Data:   ${response.data}')
      ..writeln('$_tag ╚═══════════════════════════════');
    debugPrint(log.toString());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final log = StringBuffer()
      ..writeln('$_tag ╔══════════ ERROR ═════════════')
      ..writeln('$_tag ║ ${err.response?.statusCode} ${err.requestOptions.uri}')
      ..writeln('$_tag ║ Type:    ${err.type}')
      ..writeln('$_tag ║ Message: ${err.message}');
    if (err.response?.data != null) {
      log.writeln('$_tag ║ Data:    ${err.response?.data}');
    }
    log.writeln('$_tag ╚═══════════════════════════════');
    debugPrint(log.toString());
    super.onError(err, handler);
  }

  String _formatHeaders(Map<String, dynamic> headers) {
    final map = Map<String, dynamic>.from(headers);
    if (map.containsKey('authorization')) {
      final auth = map['authorization'] as String? ?? '';
      if (auth.length > 20) {
        map['authorization'] = '${auth.substring(0, 15)}...';
      }
    }
    return map.toString();
  }
}
