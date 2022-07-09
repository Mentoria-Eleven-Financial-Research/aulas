import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/modules/login/create_account/create_account_page.dart';
import 'package:todoapp/modules/login/login/bloc/login_bloc.dart';
import 'package:todoapp/modules/login/login/repositories/login_repository.dart';
import 'package:todoapp/modules/login/login/repositories/login_repository_impl.dart';
import 'package:todoapp/modules/login/splash/splash_page.dart';

import 'login/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<LoginRepository>(
          (i) => LoginRepositoryImpl(),
        ),
        Bind.singleton(
          (i) => LoginBloc(
            repository: i.get<LoginRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SplashPage.routeName,
          child: (_, __) => const SplashPage(),
        ),
        ChildRoute(
          LoginPage.routeName,
          child: (_, __) => const LoginPage(),
        ),
        ChildRoute(
          CreateAccountPage.routeName,
          child: (_, __) => const CreateAccountPage(),
        ),
      ];
}
