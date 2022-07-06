import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/modules/notes/home/bloc/home_controller.dart';
import 'package:todoapp/modules/notes/home/home_page.dart';
import 'package:todoapp/modules/notes/repository/home_repository.dart';
import 'package:todoapp/modules/notes/repository/home_repository_impl.dart';

import 'create_note/create_note.dart';

class NotesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<HomeRepository>(
          (i) => HomeRepositoryImpl(),
        ),
        Bind.singleton(
          (i) => HomeBloc(
            repository: i.get<HomeRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, __) => const HomePage(),
        ),
        ChildRoute(
          '/newNote',
          child: (context, args) => const NewNotePage(),
        ),
      ];
}
