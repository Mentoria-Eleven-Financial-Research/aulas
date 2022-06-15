import 'package:flutter/material.dart';
import 'package:todoapp/home/home_repository.dart';

import 'home_status.dart';

typedef Task = Map<String, dynamic>;

class HomeController {
  final HomeRepository repository = HomeRepository();

  final statusNotifier = ValueNotifier(HomeStatus.empty);

  final buttonNotifier = ValueNotifier(HomeStatus.empty);

  HomeStatus get status => statusNotifier.value;
  set status(HomeStatus newValue) {
    statusNotifier.value = newValue;
  }

  List<Task> tasks = [];

  HomeController();

  void listen(Function() onListen) {
    statusNotifier.addListener(() {
      onListen();
    });
  }

  Future<void> getTasks() async {
    status = HomeStatus.loading;
    final response = await repository.getTasks();
    tasks = response;
    status = HomeStatus.success;
  }

  List<Task> get tasksTodo =>
      tasks.where((element) => element['value'] == false).toList();
  List<Task> get tasksDone =>
      tasks.where((element) => element['value'] == true).toList();

  Future<void> addTask(Task task) async {
    status = HomeStatus.loading;
    await Future.delayed(const Duration(seconds: 3));
    tasks.add(task);
    status = HomeStatus.success;
  }

  void updateTask(String id, bool value) {
    final index = tasks.indexWhere((element) => element['id'] == id);
    tasks[index]['value'] = value;
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
