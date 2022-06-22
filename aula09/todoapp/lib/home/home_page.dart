import 'package:flutter/material.dart';
import 'package:todoapp/home/controller/home_controller.dart';
import 'package:todoapp/home/widgets/notes_body.dart';

import 'widgets/home_fab.dart';

typedef Task = Map<String, dynamic>;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  void onUpdate() {
    setState(() {});
  }

  @override
  void initState() {
    controller = HomeController(onUpdate: onUpdate);
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      controller.checkHasUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        title: const Text('TodoApp'),
        backgroundColor: const Color(0xffE5E5E5),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotesBody(
              controller: controller,
              sectionTitle: 'Tarefas',
              tasks: controller.tasksTodo,
              onUpdate: onUpdate,
            ),
            NotesBody(
              controller: controller,
              sectionTitle: 'Finalizadas',
              tasks: controller.tasksDone,
              onUpdate: onUpdate,
            ),
          ],
        ),
      ),
      floatingActionButton: HomeFAB(controller: controller),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
