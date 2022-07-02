abstract class HttpClient {
  Future<dynamic> get(String path, {Map? queryParams});
  Future<dynamic> post(String path, {Map? body, Map? queryParams});
  Future<dynamic> put(String path, {Map? body, Map? queryParams});
  Future<dynamic> delete(String path, {Map? body, Map? queryParams});
}
