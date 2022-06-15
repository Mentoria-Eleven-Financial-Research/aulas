import 'package:flutter/material.dart';
import 'package:todoapp/create_note/create_note.dart';
import 'package:todoapp/home/home_controller.dart';
import 'package:todoapp/shared/widgets/button.dart';
import 'package:todoapp/shared/widgets/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final controller = HomeController(() {
    setState(() {});
  });

  @override
  void initState() {
    controller.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xffE5E5E5),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (controller.tasksTodo.isNotEmpty)
              Text(
                "Tarefas (${controller.tasksTodo.length})",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.tasksTodo.length,
                itemBuilder: (_, index) => Note(
                    task: controller.tasksTodo[index],
                    onChanged: (value) {
                      controller.updateTask(
                          controller.tasksTodo[index]['id'], value);
                    })),
            if (controller.tasksDone.isNotEmpty)
              Text(
                "Finalizadas (${controller.tasksDone.length})",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.tasksDone.length,
                itemBuilder: (_, index) => Note(
                    task: controller.tasksDone[index],
                    onChanged: (value) {
                      controller.updateTask(
                          controller.tasksDone[index]['id'], value);
                    })),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Button(
            active: true,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateNotePage(onCreate: (task) {
                            final newTask = task;
                            task['id'] = "${controller.tasks.length + 1}";
                            controller.addTask(newTask);
                          })));
            },
            title: "New Task"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
