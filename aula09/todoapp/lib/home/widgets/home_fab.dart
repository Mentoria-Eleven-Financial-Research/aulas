import 'package:flutter/material.dart';
import 'package:todoapp/create_note/create_note.dart';

import '../../shared/widgets/button.dart';
import '../controller/home_controller.dart';

class HomeFAB extends StatelessWidget {
  const HomeFAB({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Button(
        active: true,
        onPressed: () async {
          Navigator.pushNamed(
            context,
            NewNotePage.routeName,
            arguments: NewNotePageArguments(
              onCreate: (task) {
                final newTask = task;
                task['id'] = "${controller.tasks.length + 1}";
                controller.addTask(newTask);
              },
            ),
          );
        },
        title: "New Task",
      ),
    );
  }
}
