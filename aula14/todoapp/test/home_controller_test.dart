import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todoapp/home/bloc/home_controller.dart';
import 'package:todoapp/home/bloc/home_state.dart';
import 'package:todoapp/home/home_page.dart';
import 'package:todoapp/login/repositories/login_repository.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  HomeBloc? controller;
  late final LoginRepository repository;

  group('Home bloc', () {
    final task = {
      'title': 'Nova nova',
      'subtitle': 'minha nova nota',
      'id': 0,
      'value': false,
    };
    setUpAll(() {
      repository = MockLoginRepository();
      controller = HomeBloc(repository: repository);
    });
    test('should return initial state tasks empty', () {
      expect(controller!.tasks, []);
      expect(controller!.state.runtimeType, HomeStateEmpty);
      expect(controller!.tasks.isEmpty, true);
    });
    test('should add one task to tasks list', () {
      controller!.addTask(task);

      expect(controller!.tasks.isNotEmpty, true);
      expect(controller!.tasks.length, 1);
      expect(controller!.tasks.last, task);
    });

    test('should add 10 tasks', () {
      final tasks = List.generate(
          10,
          (index) => {
                'title': 'Nova nova nota $index',
                'subtitle': 'minha nova nota',
                'id': index,
                'value': false,
              });

      for (Task i in tasks) {
        controller!.addTask(i);
      }

      expect(controller!.tasks.last['id'], 10);
      expect(controller!.tasks.length, 11);
      expect(controller!.tasks.first, task);
      expect(controller!.tasks[5]['title'], 'Nova nova nota 4');
    });

    test('Should remove task with id 5', () {
      when(repository.forgotPassword(user: 'user'))
          .thenAnswer((_) => Future.value(true));

      expect(controller!.tasks.any((element) => element['id'] == 5), true);
      expect(controller!.tasks.length, 11);

      controller!.removeTask(5);

      expect(controller!.tasks.length, 10);
      verify(repository.forgotPassword(user: 'user')).called(1);
      expect(controller!.tasks.any((e) => e['id'] == 5), false);
    });
  });
}
