import 'package:flutter/material.dart';
import 'package:todoapp/shared/theme/app_theme_injection.dart';

class Button extends StatefulWidget {
  final Function() onPressed;
  final String title;
  final bool? active;
  final double? width;
  final double? height;

  const Button({
    Key? key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.active,
  }) : super(key: key);

  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  late bool _active = widget.active ?? false;

  void onChange(bool value) {
    _active = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 60,
      width: widget.width ?? double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_active
                  ? AppThemeInjection.of(context).colors.buttonActive
                  : AppThemeInjection.of(context).colors.buttonInactive)),
          onPressed: _active ? widget.onPressed : null,
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
