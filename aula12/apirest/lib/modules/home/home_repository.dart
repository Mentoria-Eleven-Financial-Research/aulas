import 'package:apirest/modules/home/models/post_model.dart';
import 'package:apirest/shared/services/http/http_client_dio.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getPosts();
}

class HomeRepositoryImpl implements HomeRepository {
  final client = HttpClientDio();
  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response =
          await client.get("https://jsonplaceholder.typicode.com/posts");
      return (response as List<dynamic>)
          .map((e) => PostModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
