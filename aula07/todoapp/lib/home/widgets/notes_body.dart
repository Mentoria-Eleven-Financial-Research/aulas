import 'package:flutter/material.dart';

import '../../shared/widgets/note.dart';
import '../controller/home_controller.dart';
import '../home_page.dart';

class NotesBody extends StatelessWidget {
  final HomeController controller;
  final String sectionTitle;
  final List<Task> tasks;
  final VoidCallback onUpdate;

  const NotesBody({
    Key? key,
    required this.controller,
    required this.sectionTitle,
    required this.tasks,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (tasks.isNotEmpty)
          Text(
            "$sectionTitle (${tasks.length})",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (_, index) => Note(
            onUpdate: onUpdate,
            task: tasks[index],
            onChanged: (value) {
              final myTask = tasks[index];
              myTask['value'] = value;
              controller.updateTask(myTask);
            },
            onSave: (Task myTask) {
              controller.updateTask(myTask);
            },
            onDelete: (id) => controller.removeById(id: id),
          ),
        ),
      ],
    );
  }
}
