abstract class LoginEvent {
  const LoginEvent();
}

class TryLoginEvent extends LoginEvent {
  final String user;
  final String password;

  TryLoginEvent({
    required this.user,
    required this.password,
  });
}

class InvalidLoginOrPasswordEvent extends LoginEvent {}

class ValidLoginOrPasswordEvent extends LoginEvent {}
