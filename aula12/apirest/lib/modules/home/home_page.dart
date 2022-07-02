import 'package:apirest/modules/home/home_controller.dart';
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
        builderSuccess: (_) => ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (_, index) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text("${controller.posts[index].id}")),
                    title: Text(controller.posts[index].title),
                  ),
                )),
      ),
    );
  }
}
