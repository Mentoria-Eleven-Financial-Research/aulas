import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/shared/widgets/button.dart';

class HomeFAB extends StatefulWidget {
  const HomeFAB({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFAB> createState() => _HomeFABState();
}

class _HomeFABState extends State<HomeFAB> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Button(
        active: true,
        onPressed: () {
          Modular.to.pushNamed('/home/newNote');
        },
        title: "New Task",
      ),
    );
  }
}
