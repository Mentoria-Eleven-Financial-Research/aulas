import 'package:apirest/http_client.dart';
import 'package:apirest/modules/home/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getPosts();
}

class HomeRepositoryImpl implements HomeRepository {
  final client = HttpClientImpl();
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
