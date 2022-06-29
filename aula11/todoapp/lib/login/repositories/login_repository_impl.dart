import 'package:todoapp/login/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<bool> forgotPassword({required String user}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> login({
    required String user,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3));

    return Future.value(true);
  }
}
