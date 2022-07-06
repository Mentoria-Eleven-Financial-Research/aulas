import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/modules/notes/home/bloc/home_controller.dart';
import 'package:todoapp/modules/notes/home/bloc/home_event.dart';
import 'package:todoapp/modules/notes/home/home_page.dart';

class NewNotePageArguments {
  final Task? task;
  final Key? key;

  NewNotePageArguments({
    this.task,
    this.key,
  });
}

class NewNotePage extends StatefulWidget {
  static const routeName = '/home/newNote';

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

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      task = Modular.args.data?['data'] ?? <String, dynamic>{};
      if (!task.containsKey('value')) {
        task = <String, dynamic>{'value': false};
      } else {
        task = task;
        _titleController.text = task['title'];
        _subtitleController.text = task['subtitle'];
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
                            Navigator.pop(context);
                            Modular.get<HomeBloc>()
                                .add(EditTaskEvent(task: task));
                          } else {
                            Navigator.pop(context);
                            Modular.get<HomeBloc>()
                                .add(AddTaskEvent(task: task));
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
