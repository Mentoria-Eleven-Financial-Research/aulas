import '../home_page.dart';

abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final Task task;
  AddTaskEvent({required this.task});
}

class EditTaskEvent extends HomeEvent {
  final Task task;

  EditTaskEvent({required this.task});
}

class RemoveTaskEvent extends HomeEvent {
  final int id;

  RemoveTaskEvent({
    required this.id,
  });
}
