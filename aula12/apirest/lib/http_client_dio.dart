import 'dart:developer';

import 'package:apirest/http_client.dart';
import 'package:dio/dio.dart';

class InterceptorLog implements InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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

class HttpClientDio extends HttpClient {
  late final client =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"))
        ..interceptors.add(InterceptorLog());
  @override
  Future delete(String path, {Map? body, Map? queryParams}) async {
    try {
      final response = await client.delete(path);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future get(String path, {Map? queryParams}) async {
    try {
      final response = await client.get(path);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(String path, {Map? body, Map? queryParams}) async {
    try {
      final response = await client.post(path);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(String path, {Map? body, Map? queryParams}) async {
    try {
      final response = await client.put(path);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
