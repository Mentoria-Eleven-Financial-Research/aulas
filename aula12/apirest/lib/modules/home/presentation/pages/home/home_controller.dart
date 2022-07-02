import 'package:apirest/modules/home/data/repositories/home_repository_impl.dart';
import 'package:apirest/modules/home/domain/entities/post.dart';
import 'package:apirest/modules/home/domain/usecases/get_posts_usecase.dart';
import 'package:apirest/shared/helpers/base_state.dart';

class HomeController extends BaseState {
  final repository = HomeRepositoryImpl();
  late final getPostsUseCase = GetPostsUsecase(repository: repository);
  List<Post> posts = [];

  Future<void> getPosts() async {
    final response = await execute<List<Post>?>(() => getPostsUseCase.call());
    if (response != null) {
      posts = response;
    }
  }
}
