import 'package:apirest/modules/home/home_repository.dart';
import 'package:apirest/modules/home/models/post_model.dart';
import 'package:apirest/shared/helpers/base_state.dart';

typedef Post = Map<String, dynamic>;

class HomeController extends BaseState {
  final repository = HomeRepositoryImpl();
  List<PostModel> posts = [];

  Future<void> getPosts() async {
    final response =
        await execute<List<PostModel>>(() => repository.getPosts());
    if (response != null) {
      posts = response;
    }
  }
}
