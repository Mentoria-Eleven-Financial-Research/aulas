import 'package:flutter/material.dart';
import 'package:todoapp/login/login_page.dart';

import '../shared/widgets/button.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
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
