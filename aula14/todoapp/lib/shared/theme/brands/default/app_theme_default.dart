import 'package:todoapp/shared/theme/interfaces/app_colors.dart';
import 'package:todoapp/shared/theme/brands/default/app_colors_default.dart';

import '../../interfaces/app_theme_base.dart';

class AppThemeDefault implements AppThemeBase {
  @override
  AppColors get colors => AppColorsDefault();
}
