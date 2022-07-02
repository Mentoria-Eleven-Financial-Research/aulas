import '../../../domain/services/http/http_client.dart';
import '../custom_dio/custom_dio.dart';

class HttpClientDio extends HttpClient {
  late final client = CustomDio();
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
      final response = await client.post(path, data: body);
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
