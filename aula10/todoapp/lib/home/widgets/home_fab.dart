import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/create_note/create_note.dart';

import '../../shared/widgets/button.dart';
import '../bloc/home_controller.dart';
import '../bloc/home_event.dart';

class HomeFAB extends StatefulWidget {
  const HomeFAB({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFAB> createState() => _HomeFABState();
}

class _HomeFABState extends State<HomeFAB> {
  @override
  void initState() {
    super.initState();
  }

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
                Navigator.pop(context);
                BlocProvider.of<HomeBloc>(context)
                    .add(AddTaskEvent(task: task));
              },
              onUpdate: (task) {
                Navigator.pop(context);
                BlocProvider.of<HomeBloc>(context)
                    .add(AddTaskEvent(task: task));
              },
            ),
          );
        },
        title: "New Task",
      ),
    );
  }
}
