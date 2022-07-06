import 'package:todoapp/modules/notes/home/home_page.dart';

abstract class HomeRepository {
  Future<bool> createTask(Task task);
  Future<bool> updateTask(Task task);
  Future<bool> deleteTask(String id);
}
