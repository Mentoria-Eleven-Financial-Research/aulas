import '../../../../core/core.dart';
import '../models/post_model.dart';
import 'home_datasource.dart';

class HomeDatasourceRemote implements HomeDatasource {
  final client = HttpClientDio();
  @override
  Future<List<PostModel>> getPosts() async {
    final response =
        await client.get("https://jsonplaceholder.typicode.com/posts");
    return (response as List<dynamic>)
        .map((e) => PostModel.fromMap(e))
        .toList();
  }
}
