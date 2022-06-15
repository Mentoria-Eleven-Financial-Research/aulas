typedef Task = Map<String, dynamic>;

class HomeController {
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
  }

  void updateTask(String id, bool value) {
    final index = tasks.indexWhere((element) => element['id'] == id);
    tasks[index]['value'] = value;
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
