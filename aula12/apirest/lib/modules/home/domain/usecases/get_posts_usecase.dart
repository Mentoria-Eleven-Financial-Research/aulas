import 'package:apirest/modules/home/domain/entities/post.dart';

import '../repositories/home_repository.dart';

class GetPostsUsecase {
  final HomeRepository repository;
  GetPostsUsecase({
    required this.repository,
  });

  Future<List<Post>?> call() async {
    try {
      final response = await repository.getPosts();
      return response;
    } catch (e) {
      return null;
    }
  }
}
