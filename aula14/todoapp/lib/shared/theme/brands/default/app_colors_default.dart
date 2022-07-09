import 'package:flutter/material.dart';
import 'package:todoapp/shared/theme/interfaces/app_colors.dart';

class AppColorsDefault implements AppColors {
  @override
  Color get buttonActive => const Color(0xff38C24E);

  @override
  Color get buttonInactive => Colors.grey;
}
