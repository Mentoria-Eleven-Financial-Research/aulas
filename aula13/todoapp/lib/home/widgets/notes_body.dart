import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/shared/widgets/note.dart';

import '../bloc/home_controller.dart';
import '../home_page.dart';

class NotesTodo extends StatelessWidget {
  const NotesTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotesBody(
        sectionTitle: 'A Fazer',
        tasks: BlocProvider.of<HomeBloc>(context).tasksTodo);
  }
}

class FinishedNotes extends StatelessWidget {
  const FinishedNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotesBody(
      sectionTitle: 'Finalizadas',
      tasks: BlocProvider.of<HomeBloc>(context).tasksDone,
    );
  }
}

class NotesBody extends StatelessWidget {
  final String sectionTitle;
  final List<Task> tasks;

  const NotesBody({
    Key? key,
    required this.sectionTitle,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (tasks.isNotEmpty)
          Text(
            "$sectionTitle (${tasks.length})",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (_, index) => Note(
            key: UniqueKey(),
            task: tasks[index],
          ),
        ),
      ],
    );
  }
}
