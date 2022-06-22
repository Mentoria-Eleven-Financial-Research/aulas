import 'package:mobx/mobx.dart';

import '../home_page.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<Task> tasks = ObservableList<Task>.of(<Task>[]);

  List<Task> get tasksTodo =>
      tasks.where((element) => element['value'] == false).toList();
  List<Task> get tasksDone =>
      tasks.where((element) => element['value'] == true).toList();

  @action
  void addTask(Task task) {
    tasks.add(task);
  }

  @action
  void updateTask(Task task) {
    final index = tasks.indexWhere((element) => element['id'] == task['id']);
    tasks.removeAt(index);
    tasks.insert(index, task);
  }

  @action
  void removeById({required String id}) {
    tasks.removeWhere((element) => element['id'] == id);
  }
}
