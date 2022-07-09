import 'package:flutter/widgets.dart';
import 'package:todoapp/shared/theme/app_theme.dart';
import 'package:todoapp/shared/theme/interfaces/app_theme_base.dart';

class AppThemeInjection extends InheritedWidget {
  final String brand;
  late AppThemeBase theme;
  AppThemeInjection({
    this.brand = "default",
    Key? key,
    required Widget child,
  }) : super(key: key, child: child) {
    changeTheme(brand);
  }

  void changeTheme(String? value) {
    theme = AppTheme.init(value ?? brand);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppThemeInjection controller(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppThemeInjection>()!;

  static AppThemeBase of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppThemeInjection>()!.theme;
}
