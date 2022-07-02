import '../../domain/entities/post.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_datasource_remote.dart';

class HomeRepositoryImpl implements HomeRepository {
  final datasource = HomeDatasourceRemote();
  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await datasource.getPosts();
      return response
          .map((e) => Post(
                title: e.title,
                body: e.body,
                id: e.id,
                userId: e.userId,
              ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
