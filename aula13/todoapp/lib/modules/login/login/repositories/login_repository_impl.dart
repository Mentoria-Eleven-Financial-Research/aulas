import 'login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<bool> forgotPassword({required String user}) {
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
