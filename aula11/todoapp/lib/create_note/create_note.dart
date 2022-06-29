import 'package:flutter/material.dart';

import '../home/home_page.dart';

class NewNotePageArguments {
  final Task? task;
  final Key? key;

  Function(Task) onCreate;
  Function(Task) onUpdate;

  NewNotePageArguments({
    this.task,
    this.key,
    required this.onCreate,
    required this.onUpdate,
  });
}

class NewNotePage extends StatefulWidget {
  static const routeName = '/new_note';

  const NewNotePage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  Task task = <String, dynamic>{};

  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  late final NewNotePageArguments args;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      args = ModalRoute.of(context)!.settings.arguments as NewNotePageArguments;
      if (args.task == null) {
        task = <String, dynamic>{'value': false};
      } else {
        task = args.task!;
        _titleController.text = args.task!['title'];
        _subtitleController.text = args.task!['subtitle'];
      }

      setState(() {});
    });

    super.initState();
  }

  bool get isEditing => task['id'] != null;

  bool hasAccept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                            args.onUpdate(task);
                          } else {
                            args.onCreate(task);
                          }
                        },
                        child: Text(
                          isEditing ? " Salvar Nota" : "Criar nota",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
