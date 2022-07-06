import 'package:flutter/material.dart';
import 'package:todoapp/modules/login/login/login_page.dart';

import 'package:todoapp/shared/widgets/button.dart';

import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final buttonKey = GlobalKey<ButtonState>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Modular.to.pushReplacementNamed(LoginPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  Hero(
                    tag: 'image01',
                    child: Image.asset(
                      "assets/images/image01.png",
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Getting things done with TODO",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Lörem ipsum ona telel och arat falogi krojaligt. Tejurat ick av triskapet. Brexit suprahibelt. Angen exodat lad, rerinde, den ryniren. Kombucha tide.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(
                    height: 68,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
