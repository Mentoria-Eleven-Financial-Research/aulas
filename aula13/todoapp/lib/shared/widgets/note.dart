import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todoapp/modules/notes/create_note/create_note.dart';
import 'package:todoapp/modules/notes/home/bloc/home_controller.dart';
import 'package:todoapp/modules/notes/home/bloc/home_event.dart';

import 'package:todoapp/modules/notes/home/home_page.dart';
import 'package:todoapp/shared/widgets/dialog_body.dart';

class Note extends StatefulWidget {
  final Task task;

  const Note({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Checkbox(
                shape: const CircleBorder(),
                value: widget.task['value'],
                onChanged: (value) {
                  if (value != null) {
                    widget.task['value'] = value;
                    Modular.get<HomeBloc>()
                        .add(EditTaskEvent(task: widget.task));
                  }
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task['title'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.task['subtitle'],
                    style: const TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    Modular.to.pushNamed(
                      NewNotePage.routeName,
                      arguments: {'data': widget.task},
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: DialogBody(
                            noteTitle: widget.task['title'],
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) {
                      if (value != null && value) {
                        Modular.get<HomeBloc>().add(
                          RemoveTaskEvent(
                            id: widget.task['id'],
                          ),
                        );
                      }
                      return null;
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ));
  }
}
