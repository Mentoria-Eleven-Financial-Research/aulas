abstract class LoginRepository {
  Future<bool> login({
    required String user,
    required String password,
  });
  Future<bool> forgotPassword({
    required String user,
  });
}
