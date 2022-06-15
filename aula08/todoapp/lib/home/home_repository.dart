import 'package:todoapp/home/home_controller.dart';

class HomeRepository {
  Future<List<Task>> getTasks() async {
    return Future.delayed(const Duration(seconds: 3))
        .then((value) => Future.value([
              {
                "id": "1",
                "title": "Teste 01 asdf0",
                "subtitle": "Meu subfsdfjh asbdfias dfas",
                "value": false
              },
              {
                "id": "2",
                "title": "Teste 010 asdf ",
                "subtitle": "Meu subfsdfjh asbdfias dfas",
                "value": false
              },
              {
                "id": "3",
                "title": "Teste 010423 dsa",
                "subtitle": "Meu subfsdfjh asbdfias dfas",
                "value": true
              },
              {
                "id": "4",
                "title": "Teste 0101231 vad",
                "subtitle": "Meu subfsdfjh asbdfias dfas",
                "value": true
              }
            ]));
  }
}
