import 'package:flutter/material.dart';

import 'package:todoapp/home/home_controller.dart';
import 'package:todoapp/home/home_status.dart';

class HomeBuilder extends StatefulWidget {
  final HomeController controller;
  final Widget Function(BuildContext context, HomeStatus status) builder;
  const HomeBuilder({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  State<HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  @override
  void initState() {
    widget.controller.listen(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.status);
  }
}
