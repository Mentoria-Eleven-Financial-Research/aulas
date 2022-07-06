import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/modules/login/login_module.dart';
import 'package:todoapp/modules/notes/notes_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: LoginModule(),
        ),
        ModuleRoute(
          '/home/',
          module: NotesModule(),
        ),
      ];
}
