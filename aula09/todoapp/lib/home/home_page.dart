import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todoapp/home/controller/home_controller.dart';

import 'widgets/home_fab.dart';
import 'widgets/notes_body.dart';

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

  late ReactionDisposer disposer;

  @override
  void initState() {
    controller = HomeController();
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      // controller.checkHasUser(context);

      disposer = reaction(
        (_) => controller.tasks,
        (myTasks) => log(
          '[MOBX]$myTasks',
        ),
        onError: (e, r) => log('[MOBX] $e /n $r'),
      );
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
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
      body: Observer(builder: (_) {
        return SingleChildScrollView(
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
        );
      }),
      floatingActionButton: HomeFAB(controller: controller),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
