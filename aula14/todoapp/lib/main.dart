import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/app_module.dart';
import 'package:todoapp/app_widget.dart';
import 'package:todoapp/shared/theme/app_theme_injection.dart';

void main() {
  const brand = String.fromEnvironment("BRAND");
  runApp(
    ModularApp(
        module: AppModule(),
        child: AppThemeInjection(
          brand: brand,
          child: const AppWidget(),
        )),
  );
}
