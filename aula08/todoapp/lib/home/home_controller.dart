import 'package:todoapp/home/home_repository.dart';

typedef Task = Map<String, dynamic>;

class HomeController {
  final HomeRepository repository = HomeRepository();
  final Function() update;
  bool isLoading = false;
  bool hasData = false;
  bool hasError = false;
  List<Task> tasks = [];

  HomeController(this.update);

  Future<void> getTasks() async {
    isLoading = true;
    update();
    final response = await repository.getTasks();
    tasks = response;
    isLoading = false;
    hasData = true;
    update();
  }

  List<Task> get tasksTodo =>
      tasks.where((element) => element['value'] == false).toList();
  List<Task> get tasksDone =>
      tasks.where((element) => element['value'] == true).toList();

  Future<void> addTask(Task task) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    tasks.add(task);
    hasData = true;
  }

  void updateTask(String id, bool value) {
    final index = tasks.indexWhere((element) => element['id'] == id);
    tasks[index]['value'] = value;
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
