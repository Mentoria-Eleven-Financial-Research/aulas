import 'package:apirest/modules/home/presentation/pages/home/home_controller.dart';
import 'package:apirest/modules/home/presentation/widgets/list_post_widget.dart';
import 'package:apirest/shared/widgets/api_builder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ApiBuilder(
        controller: controller,
        // builderInitial: (_) => ElevatedButton(
        //     onPressed: controller.getPosts, child: const Text("Buscar posts")),
        builderSuccess: (_) => ListPostsWidget(
          posts: controller.posts,
        ),
      ),
    );
  }
}
