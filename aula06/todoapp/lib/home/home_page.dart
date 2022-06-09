import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/note.dart';

typedef Task = Map<String, dynamic>;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [
    {
      "id": "1",
      "title": "Teste 01 asdf0",
      "subtitle": "Meu subfsdfjh asbdfias dfas",
      "value": false
    },
    {
      "id": "2",
      "title": "Teste 010 asdf ",
      "subtitle": "Meu subfsdfjh asbdfias dfas",
      "value": false
    },
    {
      "id": "3",
      "title": "Teste 010423 dsa",
      "subtitle": "Meu subfsdfjh asbdfias dfas",
      "value": true
    },
    {
      "id": "4",
      "title": "Teste 0101231 vad",
      "subtitle": "Meu subfsdfjh asbdfias dfas",
      "value": true
    }
  ];
  //{
  //title: "AFFSD"
  //subtitle: "AAA"
  //value: true
  //
  //}

  List<Task> get tasksTodo =>
      tasks.where((element) => element['value'] == false).toList();
  List<Task> get tasksDone =>
      tasks.where((element) => element['value'] == true).toList();

  void addTask(Task task) {
    tasks.add(task);
    setState(() {});
  }

  void updateTask(Task task) {
    final index = tasks.indexWhere((element) => element['id'] == task['id']);
    tasks[index] = task;
    setState(() {});
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    setState(() {});
  }

  void removeById({required String id}) {
    tasks.removeWhere((element) => element['id'] == id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        title: const Text('TodoApp'),
        backgroundColor: const Color(0xffE5E5E5),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (tasksTodo.isNotEmpty)
              Text(
                "Tarefas (${tasksTodo.length})",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tasksTodo.length,
              itemBuilder: (_, index) => Note(
                task: tasksTodo[index],
                onChanged: (value) {
                  final myTask = tasksTodo[index];
                  myTask['value'] = value;
                  updateTask(myTask);
                },
                onSave: (Task myTask) {
                  updateTask(myTask);
                },
                onDelete: (id) => removeById(id: id),
              ),
            ),
            if (tasksDone.isNotEmpty)
              Text(
                "Finalizadas (${tasksDone.length})",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: tasksDone.length,
                itemBuilder: (_, index) => Note(
                      task: tasksDone[index],
                      onChanged: (value) {
                        final myTask = tasksTodo[index];
                        myTask['value'] = value;
                        updateTask(myTask);
                      },
                      onSave: (Task myTask) {
                        updateTask(myTask);
                      },
                      onDelete: (id) => removeById(id: id),
                    )),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Button(
      //       active: true,
      //       onPressed: () async {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => CreateNotePage(
      //               onCreate: (task) {
      //                 final newTask = task;
      //                 task['id'] = "${tasks.length + 1}";
      //                 addTask(newTask);
      //               },
      //             ),
      //           ),
      //         );
      //       },
      //       title: "New Task"),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
