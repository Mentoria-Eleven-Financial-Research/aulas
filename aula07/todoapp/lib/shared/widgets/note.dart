import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/dialog_body.dart';

import '../../create_note/create_note.dart';
import '../../home/home_page.dart';

class Note extends StatelessWidget {
  final Task task;
  final VoidCallback onUpdate;
  final Function(bool) onChanged;
  final Function(Task) onSave;
  final Function(String) onDelete;
  const Note({
    Key? key,
    required this.task,
    required this.onChanged,
    required this.onSave,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

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
                value: task['value'],
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task['title'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    task['subtitle'],
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
                    await Navigator.pushNamed(
                      context,
                      NewNotePage.routeName,
                      arguments: NewNotePageArguments(
                        task: task,
                        onCreate: onSave,
                      ),
                    );
                    onUpdate();
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    final bool? delete = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: DialogBody(
                            noteTitle: task['title'],
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
                    );

                    if (delete != null && delete) {
                      onDelete(task['id']);
                    }
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ));
  }
}
