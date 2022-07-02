import 'package:apirest/modules/home/domain/entities/post.dart';
import 'package:flutter/material.dart';

class ListPostsWidget extends StatelessWidget {
  final List<Post> posts;
  const ListPostsWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) => Card(
              child: ListTile(
                leading: CircleAvatar(child: Text("${posts[index].id}")),
                title: Text(posts[index].title),
              ),
            ));
  }
}
