
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/home/bloc/home_event.dart';
import 'package:todoapp/home/bloc/home_state.dart';

import '../home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateEmpty()) {
    on<AddTaskEvent>(_addTask);
    on<EditTaskEvent>(_editTask);
    on<RemoveTaskEvent>(_removeTask);
  }

  final _tasks = <Task>[];

  List<Task> get tasksTodo =>
      _tasks.where((element) => element['value'] == false).toList();
  List<Task> get tasksDone =>
      _tasks.where((element) => element['value'] == true).toList();

  void _addTask(
    AddTaskEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeStateChangingList());
    await Future.delayed(const Duration(milliseconds: 10));

    Task task = event.task;
    if (_tasks.isEmpty) {
      task['id'] = 0;
    } else {
      task['id'] = (_tasks.last['id'] + 1);
    }
    _tasks.add(task);
    emitter(HomeStateRegular(tasks: _tasks));
  }

  void _editTask(
    EditTaskEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeStateChangingList());
    await Future.delayed(const Duration(milliseconds: 10));
    int index = _tasks.indexWhere(
      (element) => element['id'] == event.task['id'],
    );

    _tasks[index] = event.task;

    emitter(HomeStateRegular(tasks: _tasks));
  }

  void _removeTask(
    RemoveTaskEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(HomeStateChangingList());
    await Future.delayed(const Duration(milliseconds: 10));
    _tasks.removeWhere((element) => element['id'] == event.id);
    emitter(HomeStateRegular(tasks: _tasks));
  }
}
