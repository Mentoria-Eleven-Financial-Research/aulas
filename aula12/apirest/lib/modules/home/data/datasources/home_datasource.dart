import '../models/post_model.dart';

abstract class HomeDatasource {
  Future<List<PostModel>> getPosts();
}
