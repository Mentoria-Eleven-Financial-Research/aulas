import 'home_controller.dart';

enum HomeStatus { loading, success, empty, error }

mixin HomeStatusMixin {
  final HomeStatus _status = HomeStatus.empty;
  HomeStatus get status => _status;

  List<Task> tasks = [];
}
