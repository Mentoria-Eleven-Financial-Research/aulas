import 'dart:developer';

import 'package:dio/dio.dart';

class LogInterceptor implements InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = "Bearer Token";
    log("Request: ${options.path} | ${options.method}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("Status: ${response.statusCode}");
    handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("Error: $err");
    handler.reject(err);
  }
}
