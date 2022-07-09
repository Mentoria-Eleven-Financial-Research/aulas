import 'package:todoapp/shared/theme/brands/default/app_theme_default.dart';
import 'package:todoapp/shared/theme/brands/gabul/app_theme_gabul.dart';

import 'interfaces/app_theme_base.dart';

class AppTheme {
  static AppThemeBase init(String brand) {
    switch (brand) {
      case "gabul":
        {
          return AppThemeGabul();
        }

      default:
        {
          return AppThemeDefault();
        }
    }
  }
}
