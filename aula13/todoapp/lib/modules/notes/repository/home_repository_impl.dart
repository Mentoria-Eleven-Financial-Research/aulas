import 'package:todoapp/modules/notes/home/home_page.dart';
import 'package:todoapp/modules/notes/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<bool> createTask(Task task) {
    return Future.value(true);
  }

  @override
  Future<bool> deleteTask(String id) {
    return Future.value(true);
  }

  @override
  Future<bool> updateTask(Task task) {
    return Future.value(true);
  }
}
