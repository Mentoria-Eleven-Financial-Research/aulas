import 'package:flutter/material.dart';
import 'package:todoapp/shared/theme/interfaces/app_colors.dart';

class AppColorsGabul implements AppColors {
  @override
  Color get buttonActive => Colors.red;

  @override
  Color get buttonInactive => Colors.grey;
}
