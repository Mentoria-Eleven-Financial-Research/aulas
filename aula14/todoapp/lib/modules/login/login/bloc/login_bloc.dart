import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/modules/login/login/bloc/login_event.dart';
import 'package:todoapp/modules/login/login/bloc/login_state.dart';
import 'package:todoapp/modules/login/login/repositories/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({
    required this.repository,
  }) : super(InvalidUserOrPasswordLoginState()) {
    on<TryLoginEvent>(_login);
    on<InvalidLoginOrPasswordEvent>(
      (event, emit) => emit(
        InvalidUserOrPasswordLoginState(),
      ),
    );
    on<ValidLoginOrPasswordEvent>(
      (event, emit) => emit(
        const LoginStateRegular(),
      ),
    );
  }

  Future<void> _login(
    TryLoginEvent event,
    Emitter<LoginState> emitter,
  ) async {
    emitter(const LoginStateLoading());
    try {
      log(' [DATA]${event.user}');
      log(' [DATA]${event.password}');
      await repository.login(
        user: event.user,
        password: event.password,
      );
      emitter(const LoginStateSuccess());
    } catch (e) {
      emitter(LoginStateError(exception: e));
    }
  }
}
