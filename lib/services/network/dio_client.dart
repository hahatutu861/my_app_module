import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/providers/app_runtime_config.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';
import 'package:my_app_module/services/network/error_interceptor.dart';
import 'package:my_app_module/services/network/interceptors/logging_interceptor.dart';

String _baseUrlFor(String environment) {
  switch (environment) {
    case 'net':
      return 'https://api.hitroncloud.net';
    case 'com':
    default:
      return 'https://api.hitroncloud.com';
  }
}

final dioClientProvider = Provider<Dio>((ref) {
  final environment = ref.watch(environmentProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: _baseUrlFor(environment),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  dio.transformer = BackgroundTransformer();
  _setupProxy(dio);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['authorization'] = ref.read(tokenProvider);
        handler.next(options);
      },
    ),
  );

  dio.interceptors.add(ErrorInterceptor());
  dio.interceptors.add(LoggingInterceptor());

  return dio;
});

void _setupProxy(Dio dio) {
  NativeApi().getProxyAddress().then((proxyAddress) {
    if (proxyAddress.isNotEmpty) {
      final adapter = dio.httpClientAdapter as IOHttpClientAdapter;
      adapter.createHttpClient = () {
        final client = HttpClient();
        client.findProxy = (uri) {
          return 'PROXY $proxyAddress';
        };
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }
  });
}
