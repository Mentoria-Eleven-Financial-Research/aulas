import 'package:flutter/material.dart';

import '../home_page.dart';

class HomeController {
  final VoidCallback onUpdate;

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

  List<Task> get tasksTodo =>
      tasks.where((element) => element['value'] == false).toList();
  List<Task> get tasksDone =>
      tasks.where((element) => element['value'] == true).toList();

  HomeController({required this.onUpdate});
  Future<bool> isUserLogged() async {
    await Future.delayed(const Duration(seconds: 2));

    return Future.value(false);
  }

  void addTask(Task task) {
    tasks.add(task);
    onUpdate();
  }

  void updateTask(Task task) {
    final index = tasks.indexWhere((element) => element['id'] == task['id']);
    tasks[index] = task;
    onUpdate();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    onUpdate();
  }

  void removeById({required String id}) {
    tasks.removeWhere((element) => element['id'] == id);
    onUpdate();
  }

  void checkHasUser(BuildContext context) async {
    // iniciar animaçao
    final hasUser = await isUserLogged();

    if (hasUser) {
      // Navigator.pushReplacement(context, Home);
    } else {
      // Navigator.pushReplacement(context, Login);
    }
  }
}
