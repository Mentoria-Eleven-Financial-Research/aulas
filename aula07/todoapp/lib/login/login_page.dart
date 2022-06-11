import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp/home/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double left1 = 0.0;
  double top1 = 0.0;
  double left2 = 0.0;
  double top2 = 0.0;
  double top3 = 0.0;

  late final double x0;
  late final double y0;

  late final double x1;
  late final double y1;

  var _currentAlign = Alignment.center;
  double turns = 0;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      left1 = x0 = MediaQuery.of(context).size.width / 2 - 102;
      left2 = x0;
      top1 = y1 = MediaQuery.of(context).size.height / 2 - 138;
      top2 = y0 = MediaQuery.of(context).size.height / 2 - 186;
      top3 = MediaQuery.of(context).size.height / 2 - 162;

      setState(() {});
    });
    alignAnimate();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Timer.periodic(const Duration(seconds: 2), (_) => alignAnimate());
    });

    Timer.periodic(const Duration(seconds: 2), (_) => changeAnimation());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void alignAnimate() {
    if ((_currentAlign == Alignment.centerLeft) ||
        (_currentAlign == Alignment.bottomLeft)) {
      _currentAlign = Alignment.topLeft;
      turns -= 2;
    } else if (_currentAlign == Alignment.topLeft) {
      _currentAlign = Alignment.topRight;
      turns -= 2;
    } else if (_currentAlign == Alignment.topRight) {
      _currentAlign = Alignment.bottomRight;
      turns -= 6;
    } else if (_currentAlign == Alignment.bottomRight) {
      _currentAlign = Alignment.bottomLeft;
      turns -= 2;
    } else if (_currentAlign == Alignment.center) {
      _currentAlign = Alignment.centerLeft;
      turns -= 2;
    }
    setState(() {});
  }

  void changeAnimation() {
    if (top1 == y1) {
      top1 = y0;
      top2 = y1;
    } else {
      top1 = y1;
      top2 = y0;
    }
    setState(() {});
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
                  const SizedBox(height: 140),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  // Hero(
                  //   tag: 'image01',
                  //   child: Image.asset(
                  //     "assets/images/image01.png",
                  //     height: 300,
                  //   ),
                  // ),
                  const LoginAnimation(),
                  const SizedBox(
                    height: 57,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff38C24E))),
                        onPressed: () {
                          // onAlignChange();
                          Navigator.pushNamed(
                            context,
                            HomePage.routeName,
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            left: left1,
            top: top1,
            curve: Curves.easeInOutExpo,
            duration: const Duration(seconds: 3),
            child: const MessageImageComponent(),
          ),
          AnimatedPositioned(
            left: left1,
            top: top3,
            curve: Curves.easeInOutExpo,
            duration: const Duration(seconds: 3),
            child: const MessageImageComponent(),
          ),
          AnimatedPositioned(
            left: left2,
            top: top2,
            curve: Curves.easeInOutExpo,
            duration: const Duration(seconds: 3),
            child: const MessageImageComponent(),
          ),
          AnimatedAlign(
            duration: const Duration(seconds: 2),
            alignment: _currentAlign,
            curve: Curves.slowMiddle,
            child: AnimatedRotation(
              turns: turns,
              curve: Curves.slowMiddle,
              duration: const Duration(seconds: 2),
              child: const ChildContainer(
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginAnimation extends StatefulWidget {
  const LoginAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/image02.png",
        height: 200,
      ),
    ]);
  }
}

class MessageImageComponent extends StatelessWidget {
  const MessageImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/message_image/message_component.png",
          width: 80,
        ),
      ],
    );
  }
}

class ChildContainer extends StatelessWidget {
  const ChildContainer({
    Key? key,
    required this.shape,
  }) : super(key: key);

  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: shape,
      ),
      duration: const Duration(),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          )),
    );
  }
}
