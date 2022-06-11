import 'package:flutter/material.dart';
import 'package:todoapp/create_note/create_note.dart';
import 'package:todoapp/home/home_page.dart';
import 'package:todoapp/login/login_page.dart';
import 'package:todoapp/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
        NewNotePage.routeName: (context) => const NewNotePage(),
      },
    );
  }
}
