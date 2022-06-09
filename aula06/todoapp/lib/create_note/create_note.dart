import 'package:flutter/material.dart';

import '../home/home_page.dart';

class CreateNotePage extends StatefulWidget {
  final Function(Task) onCreate;
  final Task? task;

  const CreateNotePage({
    Key? key,
    required this.onCreate,
    this.task,
  }) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  late Task task;

  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      if (widget.task == null) {
        task = {"value": false};
      } else {
        task = widget.task!;
        _titleController.text = widget.task!['title'];
        _subtitleController.text = widget.task!['subtitle'];
      }

      setState(() {});
    });

    super.initState();
  }

  bool get isEditing => widget.task != null && widget.task!.containsKey('id');

  bool hasAccept = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(hasAccept);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    Text(
                      isEditing ? "Editar Nota" : "Criar nota",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _titleController,
                          onChanged: (value) => task['title'] = value,
                          decoration: const InputDecoration(
                            hintText: "Title",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          onChanged: (value) => task['subtitle'] = value,
                          controller: _subtitleController,
                          decoration: const InputDecoration(
                            hintText: "Description",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff38C24E))),
                          onPressed: () {
                            if (isEditing) {
                              Navigator.pop(context, task);
                            } else {
                              widget.onCreate(task);
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            isEditing ? " Salvar Nota" : "Criar nota",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff38C24E))),
                          onPressed: () {
                            hasAccept = !hasAccept;
                          },
                          child: const Text(
                            "Aceitar",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
