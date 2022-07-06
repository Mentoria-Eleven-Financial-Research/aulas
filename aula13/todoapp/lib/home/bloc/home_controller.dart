import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/home/bloc/home_event.dart';
import 'package:todoapp/home/bloc/home_state.dart';
import 'package:todoapp/login/repositories/login_repository.dart';

import '../home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoginRepository repository;
  HomeBloc({
    required this.repository,
  }) : super(HomeStateEmpty()) {
    on<AddTaskEvent>(_addTask);
    on<EditTaskEvent>(_editTask);
    on<RemoveTaskEvent>(_removeTask);
  }

  final tasks = <Task>[];

  List<Task> get tasksTodo =>
      tasks.where((element) => element['value'] == false).toList();
  List<Task> get tasksDone =>
      tasks.where((element) => element['value'] == true).toList();

  void _addTask(
    AddTaskEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeStateChangingList());
    await Future.delayed(const Duration(milliseconds: 10));

    Task task = event.task;
    if (tasks.isEmpty) {
      task['id'] = 0;
    } else {
      task['id'] = (tasks.last['id'] + 1);
    }
    tasks.add(task);
    emitter(HomeStateRegular(tasks: tasks));
  }

  void addTask(Task task) async {
    if (tasks.isEmpty) {
      task['id'] = 0;
    } else {
      task['id'] = (tasks.last['id'] + 1);
    }
    tasks.add(task);
  }

  void _editTask(
    EditTaskEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeStateChangingList());
    await Future.delayed(const Duration(milliseconds: 10));
    int index = tasks.indexWhere(
      (element) => element['id'] == event.task['id'],
    );

    tasks[index] = event.task;

    emitter(HomeStateRegular(tasks: tasks));
  }

  void editTask(Task task) async {
    int index = tasks.indexWhere(
      (element) => element['id'] == task['id'],
    );

    tasks[index] = task;
  }

  void removeTask(int id) async {
    tasks.removeWhere((element) => element['id'] == id);
    await repository.forgotPassword(user: 'user');
  }

  void _removeTask(
    RemoveTaskEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeStateChangingList());
    await Future.delayed(const Duration(milliseconds: 10));
    tasks.removeWhere((element) => element['id'] == event.id);
    emitter(HomeStateRegular(tasks: tasks));
  }
}
