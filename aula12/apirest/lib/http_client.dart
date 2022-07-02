import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<dynamic> get(String path, {Map? queryParams});
  Future<dynamic> post(String path, {Map? body, Map? queryParams});
  Future<dynamic> put(String path, {Map? body, Map? queryParams});
  Future<dynamic> delete(String path, {Map? body, Map? queryParams});
}

class HttpClientImpl implements HttpClient {
  @override
  Future get(String path, {Map? queryParams}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final uri = Uri.parse(path);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = response.body;
        final data = jsonDecode(json);
        return data;
      }
      throw Exception("Error Server, status: ${response.statusCode}");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(String path, {Map? body, Map? queryParams}) async {
    try {
      final uri = Uri.parse(path);
      final response = await http.post(uri, body: body);
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(String path, {Map? body, Map? queryParams}) async {
    try {
      final uri = Uri.parse(path);
      final response = await http.delete(
        uri,
        body: body,
      );
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(String path, {Map? body, Map? queryParams}) async {
    try {
      final uri = Uri.parse(path);
      final response = await http.put(uri, body: body);
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
