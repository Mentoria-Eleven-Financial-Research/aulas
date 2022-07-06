abstract class LoginState {
  const LoginState();
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess();
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateError extends LoginState {
  final Object? exception;
  const LoginStateError({
    this.exception,
  });
}

class LoginStateRegular extends LoginState {
  const LoginStateRegular();
}

class InvalidUserOrPasswordLoginState extends LoginState {}

extension MethodWhen on LoginState {
  void when({
    Function? onLoading,
    Function(Object? e)? onError,
    Function? onSuccess,
    Function? onUserOrLoginInvalid,
  }) {
    switch (runtimeType) {
      case LoginStateLoading:
        if (onLoading != null) onLoading();
        break;
      case LoginStateError:
        if (onError != null) onError((this as LoginStateError).exception);
        break;
      case LoginStateSuccess:
        if (onSuccess != null) onSuccess();
        break;
      case InvalidUserOrPasswordLoginState:
        if (onUserOrLoginInvalid != null) onUserOrLoginInvalid();
        break;
    }
  }
}
