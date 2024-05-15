import 'package:base_flutter/ui/resource/styles/app_colors.dart';
import 'package:flutter/material.dart';

/// define custom themes here
final lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    fontFamily: "Poppins")
  ..addAppColor(
    AppThemeType.light,
    AppColors.defaultAppColor,
  );

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    fontFamily: "Poppins")
  ..addAppColor(
    AppThemeType.dark,
    AppColors.darkThemeColor,
  );

enum AppThemeType { light, dark }

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  void addAppColor(AppThemeType type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ??
        AppColors.defaultAppColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();
  static AppThemeType currentAppThemeType = AppThemeType.light;
}