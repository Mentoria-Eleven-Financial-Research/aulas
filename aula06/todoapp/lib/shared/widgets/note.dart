import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/dialog_body.dart';

import '../../create_note/create_note.dart';
import '../../home/home_page.dart';

class Note extends StatelessWidget {
  final Task task;
  final Function(bool) onChanged;
  final Function(Task) onSave;
  final Function(String) onDelete;
  const Note({
    Key? key,
    required this.task,
    required this.onChanged,
    required this.onSave,
    required this.onDelete,
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
                    final Task? editedTask = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNotePage(
                          onCreate: (task) {},
                          task: task,
                        ),
                      ),
                    );

                    if (editedTask != null) onSave(editedTask);
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    // final bool delete = await showDialog(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (BuildContext context) {
                    //     return const AlertDialog(
                    //       content: DialogBody(),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(
                    //       20.0,
                    //     ),
                    //   ),
                    // ),
                    //     );
                    //   },
                    // );

                    // final controller = showBottomSheet(
                    //   context: context,
                    //   backgroundColor: const Color(0xffffffff),
                    //   enableDrag: false,
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(
                    //         20.0,
                    //       ),
                    //       topRight: Radius.circular(
                    //         20.0,
                    //       ),
                    //     ),
                    //   ),
                    //   builder: (context) => const DialogBody(),
                    // );

                    // controller.closed.whenComplete(() => print('fechou'));

                    // await Future.delayed(const Duration(seconds: 5)).then(
                    //   (value) => controller.close(),
                    // );

                    final delete = await showModalBottomSheet<bool>(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      useRootNavigator: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20.0,
                          ),
                          topRight: Radius.circular(
                            20.0,
                          ),
                        ),
                      ),
                      builder: (context) => const DialogBody(),
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
