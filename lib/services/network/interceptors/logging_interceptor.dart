import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  static const String _tag = '[HTTP]';
  static const int _kMaxPrintChars = 800;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logBlock('REQUEST', () {
      _logLine('║ ${options.method} ${options.uri}');
      _logLine('║ Headers: ${_formatHeaders(options.headers)}');
      _logLine('║ Query:  ${options.queryParameters}');
      if (options.data != null) {
        _logLine('║ Body:   ${options.data}');
      }
    });
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logBlock('RESPONSE', () {
      _logLine('║ ${response.statusCode} ${response.requestOptions.uri}');
      _logLine('║ Data:   ${response.data}');
    });
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logBlock('ERROR', () {
      _logLine('║ ${err.response?.statusCode} ${err.requestOptions.uri}');
      _logLine('║ Type:    ${err.type}');
      _logLine('║ Message: ${err.message}');
      if (err.response?.data != null) {
        _logLine('║ Data:    ${err.response?.data}');
      }
    });
    super.onError(err, handler);
  }

  void _logBlock(String title, VoidCallback body) {
    _logLine('╔══════════ $title ${'═' * (16 - title.length)}');
    body();
    _logLine('╚══════════════════════════════');
  }

  void _logLine(String text) {
    final full = '$_tag $text';
    if (full.length <= _kMaxPrintChars) {
      debugPrint(full);
      return;
    }
    final prefix = '$_tag ║ ... ';
    final chunkLen = _kMaxPrintChars - prefix.length;
    debugPrint(full.substring(0, _kMaxPrintChars));
    var offset = _kMaxPrintChars;
    while (offset < full.length) {
      debugPrint(prefix + full.substring(offset, min(offset + chunkLen, full.length)));
      offset += chunkLen;
    }
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
