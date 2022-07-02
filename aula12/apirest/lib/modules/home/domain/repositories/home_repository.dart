import '../entities/post.dart';

abstract class HomeRepository {
  Future<List<Post>> getPosts();
}
